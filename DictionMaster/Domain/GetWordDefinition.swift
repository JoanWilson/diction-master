//
//  GetWordDefinition.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 06/02/24.
//

import Foundation

enum GetWordDefinitionsError: Error {
    case mustBuySubscription
    case noWordDefinitions
    case serverRateLimit
    case serverError
    case unexpected
}

struct GetWordDefinitionsDTO {
    let word: String
    let language: String
}

protocol GetWordDefinition {
    func searchWordDefinition(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition]
}
