//
//  GetWordDefinition.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import Foundation

public protocol GetWordDefinition {
    func get(word: String, completion: @escaping (Result<WordDefinitionModel, Error>) -> Void)
}
