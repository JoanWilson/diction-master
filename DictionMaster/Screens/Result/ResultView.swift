//
//  ResultView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

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
                    WordDefinitionsList(meanings: wordDefinitions[0].meanings ?? [Meaning(partOfSpeech: "None", definitions: [])])
                }
                .padding(.init(top: 48, leading: 20.5, bottom: 30, trailing: 18))
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("That’s it for “\(wordDefinitions[0].word?.lowercased() ?? "NotFound")”!")
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
