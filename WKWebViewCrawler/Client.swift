//
//  Client.swift
//  WKWebViewCrawler
//
//  Created by Shunsuke Mori on 2019/08/09.
//  Copyright © 2019 Shunsuke Mori. All rights reserved.
//

import Foundation
import WebKit

public class Client: NSObject {
    private static let REQUEST_ID_LENGTH = 32
    private static let REQUEST_ID_QUERY_KEY = "fe2iro0vdmvcoep20n-829f7c3-reaoifjeiajwfne"
    
    private var webView: WKWebView!
    private var reservedCallbacks = [String: (elements: [DomElement]?) -> Void]()
    
    public convenience init(userAgent: String? = nil) {
        self.init()
        if let ua = userAgent {
            self.webView.customUserAgent = ua
        }
    }
    
    override public init() {
        super.init()
        let config = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: config)
        self.webView.navigationDelegate = self
    }
    
    public func request(_ _request: URLRequest, completion: @escaping (_ elements: [DomElement]?) -> Void) {
        let id = String.random(length: Client.REQUEST_ID_LENGTH)
        var request = _request
        request.url = request.url?.appending(Client.REQUEST_ID_QUERY_KEY, value: id)
        reservedCallbacks[id] = completion
        webView.load(request)
    }
    
    public func filter(selector: String, completion: @escaping (_ elements: [DomElement]?) -> Void) {
        let id = String.random(length: Client.REQUEST_ID_LENGTH)
        reservedCallbacks[id] = completion
        let js = """
        let elements = document.querySelectorAll("\(selector)")
        var items = []
        for (var i = 0; i < elements.length; i++) {
            items.push({
                text: elements[i].innerText,
                html: elements[i].innerHTML
            })
        }
        JSON.stringify({
            id: "\(id)",
            items: items
        })
        """
        webView.evaluateJavaScript(js) { html, error in
            guard let data = (html as? String)?.data(using: .utf8),
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let dict = json as? [String: Any],
                let id = dict["id"] as? String
                else {
                    return
            }
            
            let items = (dict["items"] as? [[String: String]])?.compactMap { item in
                return DomElement(text: item["text"], html: item["html"])
            }
            self.reservedCallbacks[id]?(items)
        }
    }
}

extension Client: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let id = webView.url?.getQueryParameter(Client.REQUEST_ID_QUERY_KEY),
            let callback = reservedCallbacks[id] {
            callback(nil)
            reservedCallbacks[id] = .none
        }
    }
}
