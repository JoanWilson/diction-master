//
//  Fallback.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//
import Domain

class Manager {
    let useCaseCache: GetWordDefinitionsUseCase
    let useCaseRemote: GetWordDefinitionsUseCase
    
    init(useCaseCache: GetWordDefinitionsUseCase, useCaseRemote: GetWordDefinitionsUseCase) {
        self.useCaseCache = useCaseCache
        self.useCaseRemote = useCaseRemote
    }
    
    func searchWordDefinition(dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        do {
            return try await useCaseCache.searchWordDefinitions(dto)
        } catch let error {
            print(error)
            return try await useCaseRemote.searchWordDefinitions(dto)
        }
    }
}
