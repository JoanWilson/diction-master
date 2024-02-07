//
//  GetWordDefinitionError.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public enum GetWordDefinitionsError: Error {
    case mustBuySubscription
    case noWordDefinitions
    case serverRateLimit
    case serverError
    case dataCannotBeDecoded
    case unexpected
    case noWordOnCache
    case noResponse
}

public struct GetWordDefinitionErrorMessage: Codable {
    public let title: String
    public let message: String
    public let resolution: String
    
    public init(title: String, message: String, resolution: String) {
        self.title = title
        self.message = message
        self.resolution = resolution
    }
}
