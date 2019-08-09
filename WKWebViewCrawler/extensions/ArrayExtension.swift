//
//  ArrayExtension.swift
//  WKWebViewCrawler
//
//  Created by Shunsuke Mori on 2019/08/09.
//  Copyright © 2019 Shunsuke Mori. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
