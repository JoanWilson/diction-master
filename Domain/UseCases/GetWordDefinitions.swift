//
//  GetWordDefinition.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import Foundation

public protocol GetWordDefinitions {
    func getWordDefinition() async throws -> [WordDefinition]
}
