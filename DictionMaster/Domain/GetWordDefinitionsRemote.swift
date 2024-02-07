//
//  GetWordDefinitionRemote.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 06/02/24.
//

import Foundation

enum HttpError: Error {
    case wrongUrl
    case noResponseFromAPI
}

public class GetWordDefinitionsRemote: GetWordDefinition {
    
    let session: HttpGetClient
    let baseURLStr: String
    
    init(session: HttpGetClient, baseURLStr: String) {
        self.session = session
        self.baseURLStr = baseURLStr
    }
    
    func searchWordDefinition(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        let urlRequest = try makeRequest(dto)
        let (data, response) = try await session.getRequest(urlRequest)
        
        if response.statusCode == 404 {
            throw GetWordDefinitionsError.noWordDefinitions
        }
        
        if response.statusCode == 429 {
            throw GetWordDefinitionsError.serverRateLimit
        }
        
        if response.statusCode == 500 {
            throw GetWordDefinitionsError.serverError
        }
        
        let decoder = JSONDecoder()
        
        let wordDefinitionArray =  try decoder.decode([WordDefinition].self, from: data)
        print(wordDefinitionArray)
        return wordDefinitionArray
    }
    
    private func makeRequest(_ dto: GetWordDefinitionsDTO) throws -> URLRequest {
        guard let url = URL(string: "\(baseURLStr)\(dto.language)/\(dto.word)gfdg") else {
            throw HttpError.wrongUrl
        }
        
        return URLRequest(url: url)
    }
    
}

class MockHttpGetClient: HttpGetClient {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        
        let (data, response) = try await session.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw GetWordDefinitionsError.unexpected
        }
        
        return (data, response)
    }
}
