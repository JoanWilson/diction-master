//
//  GetWordDefinitionUseCase.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

protocol GetWordDefinition {
    func searchWordDefinition(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition]
}
