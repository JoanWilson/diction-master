//
//  GetWordDefinitionUseCase.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public protocol GetWordDefinitionsUseCase {
    func searchWordDefinitions(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition]
}
