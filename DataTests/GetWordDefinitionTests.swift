//
//  GetWordDefinitionTests.swift
//  GetWordDefinitionTests
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import XCTest
@testable import Data

final class RemoteGetWordDefinitionTests: XCTestCase {
    func test_get_ShouldUseTheSameUrlAsHttpGetClient() throws {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteGetWordDefiniton(url: url, httpClient: httpClientSpy)
        sut.get()
        XCTAssertEqual(httpClientSpy.url, url)
    }
}

extension RemoteGetWordDefinitionTests {
    class HttpClientSpy: HttpGetClient {
        var url: URL?
        
        func get(url: URL) {
            self.url = url
        }
    }
}
