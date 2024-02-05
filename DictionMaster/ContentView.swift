//
//  ContentView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack {
            ResultView( wordDefinition: [.init(word: "Hello", phonetic: "həˈləʊ", phonetics: [.init(text: "hello", audio: "uai")], origin: "sei la", meanings: [
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
            ])])
        }
    }
}

#Preview {
    ContentView()
}
