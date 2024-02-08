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
import Security

struct ContentView: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            createSearchView()
        }
    }
    
    @MainActor func createSearchView() -> SearchView {
        let client = URLSessionHttpClient()
        let baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/"
        let cache = NSCacheRepository()
        let userCreditRepository = KeychainUserCreditRepository()
        let useCaseRemote: GetWordDefinitionsUseCase = GetWordDefinitionsRemote(
            client: client,
            baseURLStr: baseUrl,
            cache: cache,
            userCreditRepository: userCreditRepository
        )
        let viewModel = SearchView.ViewModel(useCase: useCaseRemote)
        let view = SearchView(viewModel: viewModel)
        
        return view
    }
}

#Preview {
    ContentView()
}
