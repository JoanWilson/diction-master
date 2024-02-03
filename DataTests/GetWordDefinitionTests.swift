//
//  GetWordDefinitionTests.swift
//  GetWordDefinitionTests
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import XCTest
@testable import Data

class RemoteGetWordDefiniton {
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

final class GetWordDefinitionTests: XCTestCase {
    
    private var sut: RemoteGetWordDefiniton!

    override func setUpWithError() throws {
        let url = URL(string: "http://any-url.com")!
        sut = RemoteGetWordDefiniton(url: url)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        sut.get()
    }

}
