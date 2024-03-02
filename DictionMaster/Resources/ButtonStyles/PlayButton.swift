//
//  PlayButton.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/03/24.
//

import SwiftUI

struct PlayButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color("color/white"))
            .frame(width: 22.95, height: 20.4)
            .padding(.init(top: 12.8, leading: 11.53, bottom: 12.8, trailing: 11.53))
            .background(Color("color/primary"))
            .clipShape(.circle)
    }
}

struct PlayingButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(.green))
            .frame(width: 22.95, height: 20.4)
            .padding(.init(top: 12.8, leading: 11.53, bottom: 12.8, trailing: 11.53))
    }
}
