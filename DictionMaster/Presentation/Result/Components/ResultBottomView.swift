//
//  ResultBottomView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import Domain
import SwiftUI

struct ResultBottomView: View {
    let word: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("That’s it for “\(word.lowercased())”!")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .foregroundStyle(Color("color/deep_blue"))
                .padding(.top, 35.5)
            Text("Try another search now!")
                .font(.system(.callout, design: .rounded, weight: .regular))
                .foregroundStyle(Color("color/deep_blue"))
                .padding(.top, 8)
        }
    }
}
