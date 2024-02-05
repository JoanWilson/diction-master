//
//  SearchViewModel.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import Foundation

extension SearchView {
    internal final class Intent: ObservableObject {
        @Published var searchState: SearchState = .inital
        
        func searchWord(word: String) {
            
        }
    }
}
