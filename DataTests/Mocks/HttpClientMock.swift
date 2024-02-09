//
//  HttpClientMock.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Data
import Domain

class HttpClientMock: HttpClient {
    var isFailure: Bool
    var statusCodeResponse: Int
    var word: String = ""
    private(set) var requestCalls: Int = 0
    
    init(isFailure: Bool = false, statusCodeResponse: Int = 200, word: String = "", requestCalls: Int = 0) {
        self.isFailure = isFailure
        self.statusCodeResponse = statusCodeResponse
        self.word = word
        self.requestCalls = requestCalls
    }
    
    func getRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        if isFailure {
            switch statusCodeResponse {
            case 404:
                throw GetWordDefinitionsError.noWordDefinitions
            case 429:
                throw GetWordDefinitionsError.serverRateLimit
            case 500:
                throw GetWordDefinitionsError.serverError
            default:
                throw GetWordDefinitionsError.unexpected
            }
        } else {
            requestCalls += 1
            let response = HTTPURLResponse(
                url: (request.url ?? URL(string: "http://anyurl.com"))!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            
            let mockWordDefinitions = ModelMocks.makeWordDefinitionsResponse(word: word)
            let encoder = JSONEncoder()
            let data = try encoder.encode(mockWordDefinitions)
            return (data, response!)
        }
        
    }
    
    func decodeData<T: Codable>(type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw GetWordDefinitionsError.dataCannotBeDecoded
        }
    }
}
