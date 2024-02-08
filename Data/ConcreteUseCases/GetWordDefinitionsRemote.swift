//
//  GetWordDefinitionsRemote.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

public final class GetWordDefinitionsRemote: GetWordDefinitionsUseCase {
    private let client: HttpClient
    private let baseURLStr: String
    private let cache: CacheRepository
    private let userCreditRepository: UseCreditRepository
    
    public init(client: HttpClient, 
                baseURLStr: String,
                cache: CacheRepository,
                userCreditRepository: UseCreditRepository) {
        self.client = client
        self.baseURLStr = baseURLStr
        self.cache = cache
        self.userCreditRepository = userCreditRepository
    }
    
    public func searchWordDefinitions(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        if let wordDefinition = cache.get(dto.word) {
            return [wordDefinition]
        }
        
        return try await userCreditFlow(dto)
    }
    
    private func userCreditFlow(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        guard var userCredit = userCreditRepository.loadUserCredit() else {
            let userCredit = UserCredit(isPaidUser: false, dayTime: Date(), credits: 4)
            userCreditRepository.saveUserCredit(userCredit)
            return try await performRequest(dto)
        }
        
        if userCredit.isPaidUser {
            return try await performRequest(dto)
        }
        
        if userCredit.credits >= 0 {
            userCredit.credits -= 1
            userCreditRepository.updateUserCredit(userCredit)
            return try await performRequest(dto)
        }
        
        if userCredit.checkAndResetDay() {
            userCreditRepository.updateUserCredit(userCredit)
            return try await performRequest(dto)
        }
        
        throw GetWordDefinitionsError.mustBuySubscription
    }
    
    private func performRequest(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        let urlRequest = try makeRequest(dto)
        let (data, response) = try await client.getRequest(urlRequest)
        try statusCodeValidation(response.statusCode)
        let wordDefinition = try client.decodeData(type: [WordDefinition].self, from: data)
        
        if let word = wordDefinition[0].word {
            cache.save(word, wordDefinition: wordDefinition[0])
        }
        
        return wordDefinition
    }
    
    private func makeRequest(_ dto: GetWordDefinitionsDTO) throws -> URLRequest {
        guard let url = URL(string: "\(baseURLStr)\(dto.language)/\(dto.word)") else {
            throw HttpError.wrongUrl
        }
        
        return URLRequest(url: url)
    }
    
    private func statusCodeValidation(_ statusCode: Int) throws {
        switch statusCode {
        case 404:
            throw GetWordDefinitionsError.noWordDefinitions
        case 429:
            throw GetWordDefinitionsError.serverRateLimit
        case 500:
            throw GetWordDefinitionsError.serverError
        case  200:
            break
        default:
            throw GetWordDefinitionsError.unexpected
        }
    }
}
