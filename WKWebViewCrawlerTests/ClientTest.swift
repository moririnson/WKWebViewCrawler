//
//  ClientTest.swift
//  WKWebViewCrawlerTests
//
//  Created by Shunsuke Mori on 2019/08/10.
//  Copyright © 2019 Shunsuke Mori. All rights reserved.
//

import XCTest
import Cuckoo
@testable import WKWebViewCrawler

class ClientTest: XCTestCase {
    private var mockClient: MockClient!
    
    override func setUp() {
        mockClient = MockClient()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFilter() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
