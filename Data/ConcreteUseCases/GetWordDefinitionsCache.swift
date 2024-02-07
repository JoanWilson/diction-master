//
//  GetWordDefinitionsCache.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

public final class GetWordDefinitionsCache: GetWordDefinitionsUseCase {
    private let cache: CacheGetStorage
    
    public init(cache: CacheGetStorage) {
        self.cache = cache
    }
    
    public func searchWordDefinitions(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        
        guard let wordDefinition = cache.get(dto.word) else {
            throw GetWordDefinitionsError.noWordOnCache
        }
        
        return [wordDefinition]
    }
}
