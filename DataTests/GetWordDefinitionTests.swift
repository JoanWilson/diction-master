//
//  GetWordDefinitionTests.swift
//  GetWordDefinitionTests
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import XCTest
import Domain
@testable import Data

final class RemoteGetWordDefinitionTests: XCTestCase {
    
    private var sut: RemoteGetWordDefiniton!
    private(set) var httpClientSpy: HttpClientSpy!
    
    override func setUpWithError() throws {
        let url = URL(string: MockData.anyURL.rawValue)!
        let httpClient = HttpClientSpy()
        httpClientSpy = httpClient
        sut = RemoteGetWordDefiniton(url: url, httpClient: httpClientSpy)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        httpClientSpy = nil
    }
    
//    func test_get_ShouldUseTheSameUrlAsHttpGetClient() throws {
//        let url = URL(string: MockURL.anyURL.rawValue)!
//        let httpClientSpy = HttpClientSpy()
//        let sut = RemoteGetWordDefiniton(url: url, httpClient: httpClientSpy)
//        sut.get()
//        XCTAssertEqual(httpClientSpy.url, url)
//    }
    
    func test_get_ShouldCallbackWithError_WhenClientFails() throws {
        let expected = expectation(description: "waitForCallBack")
        sut.get(word: MockData.word()) { result in
            XCTAssertEqual(result, .unexpected)
            expected.fulfill()
        }
        httpClientSpy.completeWithError(.noInternetConnection)
        wait(for: [expected], timeout: 1)
    }
}

extension RemoteGetWordDefinitionTests {
    enum MockData: String {
        case anyURL = "http://any-url.com"
        case word = "hello"
        
        func callAsFunction() -> String {
            return self.rawValue
        }
    }
    
    class HttpClientSpy: HttpGetClient {
        var url: URL?
        var completion: ((HttpError) -> Void)?
        
        func get(url: URL, completion: @escaping (HttpError) -> Void) {
            self.url = url
            self.completion = completion
        }
        
        func completeWithError(_ error: HttpError) {
            self.completion?(error)
        }
    }
}
