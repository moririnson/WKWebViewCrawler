//
//  URLRequestExtension.swift
//  WKWebViewCrawler
//
//  Created by Shunsuke Mori on 2019/08/09.
//  Copyright © 2019 Shunsuke Mori. All rights reserved.
//

import Foundation

public extension URLRequest {
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
        case head = "HEAD"
        case options = "OPTIONS"
        case trace = "TRACE"
        case connect = "CONNECT"
    }
    
    var method: HTTPMethod? {
        get {
            guard let httpMethod = self.httpMethod else { return nil }
            let method = HTTPMethod(rawValue: httpMethod)
            return method
        }
        
        set {
            self.httpMethod = newValue?.rawValue
        }
    }
}

public extension URLRequest {
    init(url: URL, method: HTTPMethod, contentType: String?) {
        self.init(url: url)
        
        self.method = method
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
    }
    
    init(url: URL, method: HTTPMethod, contentType: String?, body: Data?) {
        self.init(url: url)
        
        self.method = method
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
        self.httpBody = body
    }
    
    init(url: URL, method: HTTPMethod, contentType: String?, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) {
        
        self.init(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        
        self.method = method
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
    }
}
