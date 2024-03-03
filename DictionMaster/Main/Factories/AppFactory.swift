//
//  IntialFlowFactory.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

 import SwiftUI
 import Domain
 import Data
 import Infrastructure
 import Security

 enum AppFactory {
    @MainActor
    static func makeBuildApp() -> SearchView {
        let client = URLSessionHttpClient()
        let baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/"
        let cache = NSCacheRepository.shared
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

    static func makeSubscriptionView(isFullScreenCoverPresented: Binding<Bool>,
                                 isFullScreenViewVisible: Binding<Bool>) -> SubscriptionView {
        SubscriptionView(
            viewModel: .init(useCase: ResetUserCreditLocal(userCreditRepository: KeychainUserCreditRepository())),
            isFullScreenCoverPresented: isFullScreenCoverPresented,
            isFullScreenViewVisible: isFullScreenViewVisible)
    }
 }
