//
//  GetWordDefinitionsCacheTests.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import XCTest
import Domain
@testable import Data

final class GetWordDefinitionsCacheTests: XCTestCase {
    
    private var sut: GetWordDefinitionsCache!

    override func setUpWithError() throws {
        let mockCache = CacheGetStorageMock(isFailure: false)
        sut = GetWordDefinitionsCache(cache: mockCache)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_searchWordDefinitions_MustReturn_WordDefinitionArray() async {
        let dto = GetWordDefinitionsDTO(word: "hello", language: "en")
        do {
            let wordDefinitions = try await sut.searchWordDefinitions(dto)
            XCTAssertEqual(dto.word, wordDefinitions[0].word)
        } catch {
            XCTFail("Shouldn't fail, check dependency implementation ")
        }
        
    }
    
    func test_searchWordDefinitions_MustThrow_NoWordOnCache() async {
        let mockCache = CacheGetStorageMock(isFailure: true)
        sut = GetWordDefinitionsCache(cache: mockCache)
        let dto = GetWordDefinitionsDTO(word: "hello", language: "en")
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTFail("Shouldn't fail, check dependency implementation ")
        } catch let error as GetWordDefinitionsError {
            XCTAssertEqual(error, GetWordDefinitionsError.noWordOnCache)
        } catch {
            XCTFail("Non expected error")
        }
    }
}
