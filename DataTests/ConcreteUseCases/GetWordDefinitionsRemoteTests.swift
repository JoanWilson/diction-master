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
    
    func test_searchWordDefinitions_IfCacheIsEmpty_ShouldReturnFromClient() async throws {
        let word = "hello"
        let client = HttpClientMock(isFailure: false, word: word)
        let cache = CacheRepositoryMock()
        let userCredit = UserCreditRepositoryMock()
        
        let sut = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: "http://anytest.com",
            cache: cache,
            userCreditRepository: userCredit
        )
        
        let dto = ModelMocks.makeWordDefinitionsDTO(word: word)
        
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTAssertEqual(client.requestCalls, 1)
        } catch let error {
            print(error.localizedDescription)
            XCTFail("The worde definition was found at the cache")
        }
    }
    
    func test_searchWordDefinitions_IfCacheHasWordDefinition_MustReturnFromCache() async throws {
        let word = "hello"
        let client = HttpClientMock(isFailure: true, word: word)
        let cache = CacheRepositoryMock()
        
        cache.cache.updateValue(
            ModelMocks.makeWordDefinitionsResponse(word: word)[0],
            forKey: word
        )
        
        let userCredit = UserCreditRepositoryMock()
        
        let sut = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: "http://anytest.com",
            cache: cache,
            userCreditRepository: userCredit
        )
        
        let dto = ModelMocks.makeWordDefinitionsDTO(word: word)
        
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTAssertEqual(client.requestCalls, 0)
        } catch let error {
            print(error.localizedDescription)
            XCTFail("The worde definition was not at the cache")
        }
    }
    
    func test_searchWordDefinitions_IfTheUserDoNotHaveCredits_AndDayIsNotOver_MusReturnMustBuySubscription() async throws {
        let word = "hello"
        let client = HttpClientMock(isFailure: false, word: word)
        let cache = CacheRepositoryMock()
        let userCredit = UserCreditRepositoryMock()
        
        let userCreditModel = UserCredit(isPaidUser: false, dayTime: Date(), credits: 0)
        userCredit.saveUserCredit(userCreditModel)
        
        let sut = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: "http://anytest.com",
            cache: cache,
            userCreditRepository: userCredit
        )
        
        let dto = ModelMocks.makeWordDefinitionsDTO(word: word)
        
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTFail("Should not receive data because the user has no credits")
        } catch let error as GetWordDefinitionsError {
            XCTAssertEqual(error, GetWordDefinitionsError.mustBuySubscription)
        }
    }
    
    func test_searchWordDefinitions_IfUserIsPaid_MustPerformRequest() async throws {
        let word = "hello"
        let client = HttpClientMock(isFailure: false, word: word)
        let cache = CacheRepositoryMock()
        let userCredit = UserCreditRepositoryMock()
        
        let userCreditModel = UserCredit(isPaidUser: true, dayTime: Date(), credits: 4)
        userCredit.saveUserCredit(userCreditModel)
        
        let sut = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: "http://anytest.com",
            cache: cache,
            userCreditRepository: userCredit
        )
        
        let dto = ModelMocks.makeWordDefinitionsDTO(word: word)
        
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTAssertEqual(client.requestCalls, 1)
        } catch let error as GetWordDefinitionsError {
            print(error)
            XCTFail("Should not throw error because the user is paid")
        }
    }
    
    func test_searchWordDefinitions_IfUserHasCredits_RemoveCredit_AndPerformRequest() async throws {
        let word = "hello"
        let client = HttpClientMock(isFailure: false, word: word)
        let cache = CacheRepositoryMock()
        let userCredit = UserCreditRepositoryMock()
        
        let userCreditModel = UserCredit(isPaidUser: false, dayTime: Date(), credits: 5)
        userCredit.saveUserCredit(userCreditModel)
        
        let sut = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: "http://anytest.com",
            cache: cache,
            userCreditRepository: userCredit
        )
        
        let dto = ModelMocks.makeWordDefinitionsDTO(word: word)
        
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTAssertEqual(userCredit.loadUserCredit()?.credits, 4)
            XCTAssertEqual(client.requestCalls, 1)
        } catch let error as GetWordDefinitionsError {
            print(error)
            XCTFail("Should not throw error because the user has credits")
        }
    }
    
    func test_searchWordDefinitions_IfDayIsOver_AndUserIsNotPaidNeitherHasCredits_LoadCredits_AndPerformRequest() async throws {
        let word = "hello"
        let client = HttpClientMock(isFailure: false, word: word)
        let cache = CacheRepositoryMock()
        let userCredit = UserCreditRepositoryMock()
        
        let calendar = Calendar.current
        let now = Date()
        let oneDayAgo = calendar.date(byAdding: .day, value:  -1, to: now)!
        let userCreditModel = UserCredit(isPaidUser: false, dayTime: oneDayAgo, credits:  0)
        userCredit.saveUserCredit(userCreditModel)
        
        let sut = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: "http://anytest.com",
            cache: cache,
            userCreditRepository: userCredit
        )
        
        let dto = ModelMocks.makeWordDefinitionsDTO(word: word)
        
        do {
            _ = try await sut.searchWordDefinitions(dto)
            XCTAssertEqual(userCredit.loadUserCredit()?.credits, 4)
            XCTAssertEqual(client.requestCalls, 1)
        } catch let error as GetWordDefinitionsError {
            print(error)
            XCTFail("Should not throw error because the user has credits loaded by the new day")
        }
    }
    
    
    
}

