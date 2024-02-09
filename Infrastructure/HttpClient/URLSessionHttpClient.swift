//
//  URLSessionHttpClient.swift
//  Infrastructure
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Data
import Domain

public final class URLSessionHttpClient: HttpClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func getRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await session.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            throw GetWordDefinitionsError.noResponse
        }
            
        return (data, response)
    }
    
    public func decodeData<T>(
        type: T.Type,
        from data: Data
    ) throws -> T where T: Decodable, T: Encodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw GetWordDefinitionsError.dataCannotBeDecoded
        }
    }
}
