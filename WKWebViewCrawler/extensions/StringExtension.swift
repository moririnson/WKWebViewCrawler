//
//  StringExtension.swift
//  WKWebViewCrawler
//
//  Created by Shunsuke Mori on 2019/08/09.
//  Copyright © 2019 Shunsuke Mori. All rights reserved.
//

import Foundation

extension String {
    static func random(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var str = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            str += NSString(characters: &nextChar, length: 1) as String
        }
        
        return str
    }
}
