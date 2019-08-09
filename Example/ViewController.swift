//
//  ViewController.swift
//  Example
//
//  Created by Shunsuke Mori on 2019/08/10.
//  Copyright © 2019 Shunsuke Mori. All rights reserved.
//

import UIKit
import WKWebViewCrawler

class ViewController: UIViewController {
    private static let MY_USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A"
    
    private let client = Client(userAgent: ViewController.MY_USER_AGENT)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://qiita.com/")!
        let request = URLRequest(url: url, method: .get, contentType: "text/html")
        client.request(request) { _ in
            self.client.filter(selector: ".tr-Item") { elements in
                if let desc = elements?.description {
                    print(desc)
                }
            }
        }
    }
}

