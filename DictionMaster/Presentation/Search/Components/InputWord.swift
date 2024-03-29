//
//  InputWord.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct InputWord: View {
    @Binding var text: String
    @FocusState private var textfieldFocused: Bool
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("Type a word", text: $text, prompt: prompt, axis: .vertical)
                .font(.system(.title, design: .rounded, weight: .bold))
                .foregroundColor(Color("color/deep_blue"))
                .multilineTextAlignment(.center)
                .focused($textfieldFocused)
                            .onLongPressGesture(minimumDuration: 0.0) {
                                textfieldFocused = true
                            }
                            .autocorrectionDisabled()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var prompt: Text {
        Text(placeholder)
            .font(.system(.title, design: .rounded, weight: .regular))
            .foregroundStyle(Color("color/deep_blue").opacity(0.5))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InputWord(text: .constant(""), placeholder: "Type a word")
}
