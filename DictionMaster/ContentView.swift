//
//  ContentView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import SwiftUI
import Domain
import Data
import Infrastructure

struct ContentView: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            createSearchView()
        }
    }
    
    @MainActor func createSearchView() -> SearchView {
        let client = URLSessionHttpClient()
        let useCaseRemote: GetWordDefinitionsUseCase = GetWordDefinitionsRemote(client: client, baseURLStr: "https://api.dictionaryapi.dev/api/v2/entries/")
        let cache: CacheGetStorage = NSCacheGetStorage()
        let useCaseCache: GetWordDefinitionsUseCase = GetWordDefinitionsCache(cache: cache)
        var viewModel = SearchView.ViewModel(useCase: useCaseRemote)
        var view = SearchView(viewModel: viewModel)
        
        return view
    }
}

#Preview {
    ContentView()
}
