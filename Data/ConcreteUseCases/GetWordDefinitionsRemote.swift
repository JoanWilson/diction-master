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
    
    public init(client: HttpClient, baseURLStr: String) {
        self.client = client
        self.baseURLStr = baseURLStr
    }
    
    public func searchWordDefinitions(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        let urlRequest = try makeRequest(dto)
        let (data, response) = try await client.getRequest(urlRequest)
        try statusCodeValidation(response.statusCode)
        
        return try client.decodeData(type: [WordDefinition].self, from: data)
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
