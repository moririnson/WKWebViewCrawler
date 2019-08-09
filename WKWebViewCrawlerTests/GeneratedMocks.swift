// MARK: - Mocks generated from file: WKWebViewCrawler/Client.swift at 2019-08-09 18:13:56 +0000

//
//  Crawler.swift
//  WKWebViewCrawler
//
//  Created by Shunsuke Mori on 2019/08/09.
//  Copyright © 2019 Shunsuke Mori. All rights reserved.
//

import Cuckoo
@testable import WKWebViewCrawler

import Foundation
import WebKit


public class MockClient: Client, Cuckoo.ClassMock {
    
    public typealias MocksType = Client
    
    public typealias Stubbing = __StubbingProxy_Client
    public typealias Verification = __VerificationProxy_Client

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: Client?

    public func enableDefaultImplementation(_ stub: Client) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public override func request(_ _request: URLRequest, completion: @escaping (_ elements: [DomElement]?) -> Void)  {
        
    return cuckoo_manager.call("request(_: URLRequest, completion: @escaping (_ elements: [DomElement]?) -> Void)",
            parameters: (_request, completion),
            escapingParameters: (_request, completion),
            superclassCall:
                
                super.request(_request, completion: completion)
                ,
            defaultCall: __defaultImplStub!.request(_request, completion: completion))
        
    }
    
    
    
    public override func filter(selector: String, completion: @escaping (_ elements: [DomElement]?) -> Void)  {
        
    return cuckoo_manager.call("filter(selector: String, completion: @escaping (_ elements: [DomElement]?) -> Void)",
            parameters: (selector, completion),
            escapingParameters: (selector, completion),
            superclassCall:
                
                super.filter(selector: selector, completion: completion)
                ,
            defaultCall: __defaultImplStub!.filter(selector: selector, completion: completion))
        
    }
    

	public struct __StubbingProxy_Client: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ _request: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(URLRequest, (_ elements: [DomElement]?) -> Void)> where M1.MatchedType == URLRequest, M2.MatchedType == (_ elements: [DomElement]?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(URLRequest, (_ elements: [DomElement]?) -> Void)>] = [wrap(matchable: _request) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockClient.self, method: "request(_: URLRequest, completion: @escaping (_ elements: [DomElement]?) -> Void)", parameterMatchers: matchers))
	    }
	    
	    func filter<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(selector: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, (_ elements: [DomElement]?) -> Void)> where M1.MatchedType == String, M2.MatchedType == (_ elements: [DomElement]?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (_ elements: [DomElement]?) -> Void)>] = [wrap(matchable: selector) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockClient.self, method: "filter(selector: String, completion: @escaping (_ elements: [DomElement]?) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_Client: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ _request: M1, completion: M2) -> Cuckoo.__DoNotUse<(URLRequest, (_ elements: [DomElement]?) -> Void), Void> where M1.MatchedType == URLRequest, M2.MatchedType == (_ elements: [DomElement]?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(URLRequest, (_ elements: [DomElement]?) -> Void)>] = [wrap(matchable: _request) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("request(_: URLRequest, completion: @escaping (_ elements: [DomElement]?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func filter<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(selector: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (_ elements: [DomElement]?) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (_ elements: [DomElement]?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (_ elements: [DomElement]?) -> Void)>] = [wrap(matchable: selector) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("filter(selector: String, completion: @escaping (_ elements: [DomElement]?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class ClientStub: Client {
    

    

    
    public override func request(_ _request: URLRequest, completion: @escaping (_ elements: [DomElement]?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public override func filter(selector: String, completion: @escaping (_ elements: [DomElement]?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

