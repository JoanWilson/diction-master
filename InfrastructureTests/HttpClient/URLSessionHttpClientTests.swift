//
//  InfrastructureTests.swift
//  InfrastructureTests
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import XCTest
import Domain
@testable import Infrastructure

final class URLSessionHttpClientTests: XCTestCase {
    var httpClient: URLSessionHttpClient!

        override func setUp() {
            super.setUp()
            let configuration = URLSessionConfiguration.ephemeral
            configuration.protocolClasses = [MockURLProtocol.self]
            let session = URLSession(configuration: configuration)
            httpClient = URLSessionHttpClient(session: session)
        }

        override func tearDown() {
            super.tearDown()
            MockURLProtocol.stub.removeAll()
        }

        func test_GetRequest_ShouldReturn_200StatusCode() async throws {
            let url = URL(string: "https://example.com")!
            let request = URLRequest(url: url)
            let expectedData = Data("Test data".utf8)
            let expectedResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!

            MockURLProtocol.stub[request] = (expectedData, expectedResponse)

            let (data, response) = try await httpClient.getRequest(request)

            XCTAssertEqual(data, expectedData)
            XCTAssertEqual(response.statusCode, expectedResponse.statusCode)
        }

        func test_Decode_ShouldReturn_SameData() throws {
            struct TestModel: Codable, Equatable {
                let name: String
            }

            let jsonData = Data("""
            {
                "name": "Test"
            }
            """.utf8)

            let expectedModel = TestModel(name: "Test")

            let model = try httpClient.decodeData(type: TestModel.self, from: jsonData)
            XCTAssertEqual(model, expectedModel)
        }

        func test_Decode_ShouldReturn_WrongData() {
            struct TestModel: Codable {
                let name: String
            }

            let jsonData = Data("""
            {
                "name": 123
            }
            """.utf8)

            XCTAssertThrowsError(try httpClient.decodeData(type: TestModel.self, from: jsonData)) { error in
                XCTAssertEqual(error as? GetWordDefinitionsError, .dataCannotBeDecoded)
            }
        }

}
