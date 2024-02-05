//
//  ResultView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct Meaning: Codable, Hashable {
    let partOfSpeech: String
    let definitions: [Definition]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(partOfSpeech)
        hasher.combine(definitions)
    }
    
    static func == (lhs: Meaning, rhs: Meaning) -> Bool {
        return lhs.partOfSpeech == rhs.partOfSpeech && lhs.definitions == rhs.definitions
    }
}

struct Definition: Codable, Hashable {
    let definition: String
    let example: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(definition)
        hasher.combine(example)
    }
    
    static func == (lhs: Definition, rhs: Definition) -> Bool {
        return lhs.definition == rhs.definition && lhs.example == rhs.example
    }
}

struct ResultView: View {
    
    @State var meanings: [Meaning] = [
        Meaning(
            partOfSpeech: "noun",
            definitions: [
                .init(
                    definition: "used as a greeting or to begin a phone ",
                    example: "hello there, Katie!"
                )
            ]
        ),
        Meaning(
            partOfSpeech: "exclamation",
            definitions: [
                .init(
                    definition: "dasd dsasd d dasd ",
                    example: "hdasd dasd !"
                )
            ]
        )
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    ResultHeaderView(title: "Hello", subtitle: "həˈləʊ")
                        .padding(.bottom, 25)
                    WordDefinitionsList(meanings: meanings)
                }
                .padding(.init(top: 48, leading: 17, bottom: 30, trailing: 18))
                
                Divider()
                
                Text("That's All")
                Button(
                    "SEARCH",
                    action: {
                        print("itsGood")
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                )
                .buttonStyle(.primary)
            }
            
        }.scrollBounceBehavior(.basedOnSize)
    }
    
}

#Preview {
    ResultView()
}
