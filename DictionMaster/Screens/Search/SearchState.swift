//
//  SearchState.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import Foundation

enum SearchState {
    case inital
    case wordFound
    case wordNotFound
    case needsPurchase
    case rateLimit
    case serverError
}
