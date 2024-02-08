//////
//////  ResultView.swift
//////  DictionMaster
//////
//////  Created by Joan Wilson Oliveira on 05/02/24.
//////
////
import Domain
import SwiftUI

struct ResultWordDefinition {
    let title: String
    let phonetic: String
    let audioURLStr: String
    let definitions: [ResultDefinition]
}

struct ResultDefinition: Hashable {
    let partOfSpeech: String
    let definition: String
    let example: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(partOfSpeech)
        hasher.combine(definition)
        hasher.combine(example)
    }
}

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    
    let model: ResultWordDefinition

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    ResultHeaderView(title: model.title, subtitle: model.phonetic)
                        .padding(.bottom, 25)
                    WordDefinitionsList(definitions: model.definitions)
                }
                .padding(.init(top: 48, leading: 20.5, bottom: 30, trailing: 18))

                Divider()

                ResultBottomView(word: model.title)
                    .padding(.horizontal, 20.5)

                Spacer()

                Button(
                    "NEW SEARCH",
                    action: {
                        dismiss()
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                )
                .frame(height: 64)
                .buttonStyle(.primary)
                .padding(.init(top: 20, leading: 17, bottom: 31, trailing: 18))
            }
        }
    }
}

func createMockResultWordDefinition() -> ResultWordDefinition {
    let definitions = [
        ResultDefinition(partOfSpeech: "noun", definition: "the action of being affected", example: "the effect of the medicine"),
        ResultDefinition(partOfSpeech: "verb", definition: "to have an effect on", example: "the medicine had an effect on her condition")
    ]

    let mockResultWordDefinition = ResultWordDefinition(
        title: "effect",
        phonetic: "ɪˈfɛkt",
        audioURLStr: "https://example.com/audio/effect.mp3",
        definitions: definitions
    )

    return mockResultWordDefinition
}

#Preview {
    ResultView(model: createMockResultWordDefinition())
}
