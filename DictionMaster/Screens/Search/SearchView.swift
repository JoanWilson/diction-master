//
//  SearchView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var intent: Intent
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            FlagView(language: .english)
            Spacer()
            InputWord(text: $text, placeholder: "Type your word..")
            Spacer()
            if !text.isEmpty {
                Button(
                    "SEARCH",
                    action: {
                        print("itsGood")
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                )
                .buttonStyle(.primary)
            }
            
        }
        .padding(.init(top: 75, leading: 18, bottom: 20, trailing: 17))
    }
}

#Preview {
    SearchView(intent: .init())
}
