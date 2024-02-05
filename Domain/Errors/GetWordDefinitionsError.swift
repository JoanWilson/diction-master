//
//  DomainErrorEnum.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import Foundation

public enum GetWordDefinitionsError: Error {
    case mustBuySubscription
    case noWordDefinitions
    case serverRateLimit
    case serverError
    case unexpected
}
