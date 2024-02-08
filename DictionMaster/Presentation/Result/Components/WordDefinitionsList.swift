//
//  WordDefinitionsList.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import Domain
import SwiftUI

struct WordDefinitionsList: View {
    let definitions: [ResultDefinition]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(definitions.enumerated()), id: \.element) { index, definition in
                VStack(alignment: .leading) {
                    Text(
                        makeDeepBlueText(weight: .bold, "\(index + 1)) ") +
                        makeSemiLightBlueGrayLabel("\(definition.partOfSpeech)") +
                        makeDeepBlueText(weight: .bold, "\(definition.definition)")
                    )
                    .padding(.bottom, 5)
                    
                    if !definition.example.isEmpty {
                        Text(
                            makeDeepBlueText(weight: .regular, "• \(definition.example)")
                        )
                    }
                }.padding(.bottom, 30)
            }
        }
    }
    
    private func makeSemiLightBlueGrayLabel(_ str: String) -> AttributedString {
        var attrString = AttributedString("[\(str)] ")
        attrString.font = .system(.callout, design: .rounded, weight: .bold)
        attrString.foregroundColor = Color("color/semiLight_blue_gray")
        return attrString
    }
    
    private func makeDeepBlueText(weight: Font.Weight, _ str: String) -> AttributedString {
        var attrString = AttributedString(str)
        attrString.font = .system(.callout, design: .rounded, weight: weight)
        attrString.foregroundColor = Color("color/deep_blue")
        return attrString
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    WordDefinitionsList(definitions: [
        ResultDefinition(partOfSpeech: "noun", definition: "the action of being affected", example: "the effect of the medicine"),
        ResultDefinition(partOfSpeech: "verb", definition: "to have an effect on", example: "the medicine had an effect on her condition")
    ])
}
