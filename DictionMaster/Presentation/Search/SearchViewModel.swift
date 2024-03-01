//
//  SearchViewModel.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import Foundation
import Domain

extension SearchView {
    
    internal final class ViewModel: ObservableObject {
        @MainActor @Published var wordDefinitionFound: [WordDefinition] = []
        @Published var mustBuySubscription: Bool = false
        @Published var showAlert: Bool = false
        @Published var errorFound: GetWordDefinitionsError = .unexpected
        @Published var showResultView: Bool = false
        @Published var text = ""
        @Published var isLoading: Bool = false
        private var tasks: [Task<Void, Never>] = []
        
        private let useCase: GetWordDefinitionsUseCase
        
        init(useCase: GetWordDefinitionsUseCase) {
            self.useCase = useCase
        }
        
        func cancelTasks() {
            tasks.forEach({ $0.cancel() })
            tasks.removeAll()
        }
        
        func searchWord(word: String) {
            let task = Task { @MainActor in
                do {
                    let dto = GetWordDefinitionsDTO(word: word, language: "en")
                    wordDefinitionFound = try await useCase.searchWordDefinitions(dto)
                    await MainActor.run {
                        showResultView.toggle()
                        isLoading.toggle()
                    }
                    
                } catch GetWordDefinitionsError.mustBuySubscription {
                    await MainActor.run {
                        mustBuySubscription.toggle()
                        isLoading.toggle()
                    }
                } catch {
                    await MainActor.run {
                        showAlert.toggle()
                        isLoading.toggle()
                    }
                }
            }
            tasks.append(task)
        }
    }
}
