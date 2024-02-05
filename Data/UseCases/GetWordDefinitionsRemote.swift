//
//  GetWordDefinitionsRemote.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 04/02/24.
//

import Domain

public class GetWordDefinitionsRemote: GetWordDefinitions {
    
    private let url: URL
    private let httpClient: HttpGetClient
    
    public init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func getWordDefinition() async throws -> [WordDefinition] {
        []
    }
}
