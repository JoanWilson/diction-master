//
//  SearchViewModelTests.swift
//  DictionMasterTests
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import Domain
import XCTest
@testable import DictionMaster

final class SearchViewModelTests: XCTestCase {
    
    @MainActor
    func test_searchWord_MustReturnWordDefinitionArray_IfNotFail() async throws {
        let useCase: GetWordDefinitionsUseCase = GetWordDefinitionsUseCaseMock()
        let sut = SearchView.ViewModel(useCase: useCase)
        let word = "hello"
        let expectation = expectation(description: "Updating values")
        
        Task {
            DispatchQueue.main.async {
                sut.searchWord(word: word)
                XCTAssertNotEqual(sut.wordDefinitionFound.count, 0)
            }
            
            expectation.fulfill()
        }
        
        XCTAssertEqual(sut.getResultWordDefinition().title, word)
    }
    
    @MainActor
    func test_searchWord_MustThrowMustBuySubscription_IfUserHasNoCreditFail() async throws {
        let useCase: GetWordDefinitionsUseCase = GetWordDefinitionsUseCaseMock(shouldFail: true, shouldReturnSubscription: true)
        let sut = SearchView.ViewModel(useCase: useCase)
        let word = "hello"
        Task {
            DispatchQueue.main.async {
                sut.searchWord(word: word)
            }
            XCTAssertEqual(sut.wordDefinitionFound.count, 0)
            XCTAssertTrue(sut.mustBuySubscription)
        }
    }

}

struct GetWordDefinitionsUseCaseMock: GetWordDefinitionsUseCase {
    var shouldFail: Bool = false
    var shouldReturnSubscription: Bool = false
    
    func searchWordDefinitions(_ dto: Domain.GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        if shouldFail {
            throw GetWordDefinitionsError.noWordDefinitions
        }
        
        if shouldReturnSubscription {
            throw GetWordDefinitionsError.mustBuySubscription
        }
        
        return [
            WordDefinition(
                word: dto.word,
                phonetic: nil,
                phonetics: nil,
                origin: nil,
                meanings: nil
            )
        ]
    }

}
