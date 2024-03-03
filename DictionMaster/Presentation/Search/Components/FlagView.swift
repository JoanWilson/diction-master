//
//  UKFlagView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

enum Language: String {
    case english
    case french
    case spanish
    
    func callAsFunction() -> String {
        return self.rawValue
    }
}

struct FlagView: View {
    let language: Language
    
    var body: some View {
        HStack {
            Image("icon/flag/\(language)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 26, height: 27)
            
            Text(language().uppercased())
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .foregroundStyle(Color("color/deep_blue"))
                .kerning(1.8)
        }
        .padding(.init(top: 6, leading: 8, bottom: 7, trailing: 12))
        .background(Color("color/light_blue_gray").opacity(0.1))
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FlagView(language: .english)
}
