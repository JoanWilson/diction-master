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
        @Published var isFullScreenCoverPresented = false
        @Published var isFullScreenViewVisible = false
        @Published var isPurchaseViewPresented = false
        @Published var isPurchaseViewVisible = false
        private var tasks: [Task<Void, Never>] = []
        private let useCase: GetWordDefinitionsUseCase
        var isFirstAppear: Bool = true

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
                        isFullScreenCoverPresented = true
                        isLoading.toggle()
                    }
                } catch GetWordDefinitionsError.mustBuySubscription {
                    await MainActor.run {
                        isPurchaseViewPresented = true
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

        func convertToResultWordDefinition(_ wordDefinition: WordDefinition) -> ResultWordDefinition {

            guard let word = wordDefinition.word else {
                return ResultWordDefinition(title: "", phonetic: "", audioURLStr: "", definitions: [])
            }

            let phoneticText = wordDefinition.phonetics?.first(where: { $0.text != nil })?
                .text ?? wordDefinition.phonetic ?? ""
            let audioURLStr = wordDefinition.phonetics?.first { phonetic in
                if let audio = phonetic.audio {
                    return audio.count > 5
                }
                return false
            }?.audio ?? ""

            let definitions = wordDefinition.meanings?.compactMap { meaning -> [ResultDefinition] in
                meaning.definitions?.map { definition -> ResultDefinition in
                    ResultDefinition(
                        partOfSpeech: meaning.partOfSpeech ?? "",
                        definition: definition.definition ?? "",
                        example: definition.example ?? ""
                    )
                } ?? []
            }.flatMap { $0 } ?? []

            return ResultWordDefinition(
                title: word,
                phonetic: phoneticText,
                audioURLStr: audioURLStr,
                definitions: definitions
            )
        }
    }
}
