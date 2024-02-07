//
//  SearchViewModel.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import Foundation
import Domain

extension SearchView {
    @MainActor
    internal final class ViewModel: ObservableObject {
        @Published var wordDefinitionFound: [WordDefinition] = []
        @Published var mustBuySubscription: Bool = false
        @Published var showAlert: Bool = false
        @Published var errorFound: GetWordDefinitionsError = .unexpected
        
        private var tasks: [Task<Void, Never>] = []
        
        private let useCase: GetWordDefinitionsUseCase
        
//        private var manager: Manager
        
        init(useCase: GetWordDefinitionsUseCase) {
            self.useCase = useCase
        }
        
        func cancelTasks() {
            tasks.forEach({ $0.cancel() })
            tasks.removeAll()
        }
        
        func searchWord(word: String) {
            let task = Task {
                do {
                    let dto = GetWordDefinitionsDTO(word: word, language: "en")
                    wordDefinitionFound = try await useCase.searchWordDefinitions(dto)
                    print(wordDefinitionFound[0])
                } catch GetWordDefinitionsError.mustBuySubscription {
                    mustBuySubscription.toggle()
                } catch {
                    showAlert.toggle()
                    print(error)
                }
            }
            tasks.append(task)
        }
    }
}

class GetWordDefinitionsMock: GetWordDefinitionsUseCase {
    var shouldFail: Bool = false
    
    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
    }
    
    func searchWordDefinitions(_ dto: GetWordDefinitionsDTO) async throws -> [WordDefinition] {
        if shouldFail {
            throw GetWordDefinitionsError.noWordDefinitions
        } else {
            let phonetic = Phonetic(text: "mock phonetic", audio: nil)
                let meaning = Meaning(partOfSpeech: "noun", definitions: [Definition(definition: "a term", example: "mock example")])
                let mockWordDefinition = WordDefinition(
                    word: "example",
                    phonetic: "mock phonetic",
                    phonetics: [phonetic],
                    origin: "unknown",
                    meanings: [meaning]
                )
            return [mockWordDefinition]
        }
    }
}
