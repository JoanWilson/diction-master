//
//  GetWordDefinitionsRemote.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import XCTest
import Domain
@testable import Data

final class GetWordDefinitionsRemoteTests: XCTestCase {
    func test_searchWordDefinitions_MustReturn_WordDefinitionsArray() async throws {
        let dto = GetWordDefinitionsDTO(word: "hello", language: "en")
        let sut = GetWordDefinitionsRemote(
            client: HttpClientMock(
                isFailure: false,
                word: dto.word
            ),
            baseURLStr: "http://anyurl.com"
        )
        
        do {
            let result = try await sut.searchWordDefinitions(dto)
            print(result)
            XCTAssertEqual(result[0].word, dto.word)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func test_searchWordDefinitions_WhenFail_ShouldThrow_TheCorrectCode() async throws {
        let dto = GetWordDefinitionsDTO(word: "hello", language: "en")
        var client = HttpClientMock(
            isFailure: true,
            word: dto.word
        )
        client.statusCodeResponse = 404
        let sut = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: "http://anyurl.com"
        )
        
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTFail()
        } catch let error as GetWordDefinitionsError {
            XCTAssertEqual(error, GetWordDefinitionsError.noWordDefinitions )
        }
    }
    
}


