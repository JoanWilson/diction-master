//
//  GetWordDefinitionTests.swift
//  GetWordDefinitionTests
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import XCTest
@testable import Data

protocol HttpGetClient {
    func get(url: URL)
}

final class RemoteGetWordDefiniton {
    private let url: URL
    private let httpClient: HttpGetClient
    
    init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func get() {
        httpClient.get(url: url)
    }
}

final class GetWordDefinitionTests: XCTestCase {
    func test_() throws {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteGetWordDefiniton(url: url, httpClient: httpClientSpy)
        sut.get()
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    class HttpClientSpy: HttpGetClient {
        var url: URL?
        
        func get(url: URL) {
            self.url = url
        }
    }
}
