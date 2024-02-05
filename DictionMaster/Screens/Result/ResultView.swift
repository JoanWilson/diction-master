//
//  ResultView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

public struct WordDefinition {
    public let word: String
    public let phonetic: String
    let phonetics: [Phonetic]
    public let origin: String
    let meanings: [Meaning]
    
    init(word: String, phonetic: String, phonetics: [Phonetic], origin: String, meanings: [Meaning]) {
        self.word = word
        self.phonetic = phonetic
        self.phonetics = phonetics
        self.origin = origin
        self.meanings = meanings
    }
}

public struct Phonetic: Codable {
    public let text: String
    public let audio: String?
}

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
    var wordDefinitions: [WordDefinition] = [.init(word: "Hello", phonetic: "həˈləʊ", phonetics: [.init(text: "hello", audio: "uai")], origin: "sei la", meanings: [
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
    ])]
    
    let wordDefinition: [WordDefinition]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    ResultHeaderView(title: "Hello", subtitle: "həˈləʊ")
                        .padding(.bottom, 25)
                    WordDefinitionsList(meanings: wordDefinitions[0].meanings)
                }
                .padding(.init(top: 48, leading: 20.5, bottom: 30, trailing: 18))
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("That’s it for “\(wordDefinitions[0].word.lowercased())”!")
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .foregroundStyle(Color("color/deep_blue"))
                        .padding(.top, 35.5)
                    Text("Try another search now!")
                        .font(.system(.callout, design: .rounded, weight: .regular))
                        .foregroundStyle(Color("color/deep_blue"))
                        .padding(.top, 8)
                }.padding(.horizontal, 20.5)
                
                Button(
                    "NEW SEARCH",
                    action: {
                        print("itsGood")
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

#Preview {
    ResultView(
        wordDefinition: [
            .init(
                word: "Hello",
                phonetic: "həˈləʊ",
                phonetics: [
                    .init(
                        text: "hello",
                        audio: "uai"
                    )
                ],
                origin: "sei la",
                meanings: [
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
                            ),
                            .init(
                                definition: "dasd dsasd d dasd ",
                                example: "hdasd dasd !"
                            ),
                            .init(
                                definition: "dasd dsasd d dasd ",
                                example: "hdasd dasd !"
                            ),
                            .init(
                                definition: "dasd dsasd d dasd ",
                                example: "hdasd dasd !"
                            )
                        ]
                    )
                ]
            )
        ]
    )
}
