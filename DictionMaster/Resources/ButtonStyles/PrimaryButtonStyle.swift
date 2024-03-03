//
//  PrimaryButtonStyle.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 64)
            .background(Color("color/primary"))
            .foregroundStyle(Color("color/white"))
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .kerning(1.8)
            .clipShape(.rect(cornerRadius: 14))
            .scaleEffect(configuration.isPressed ?  0.95 :  1.0)
            .animation(
                .easeInOut(duration: 0.1),
                value: configuration.isPressed
            )
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: Self { Self() }
}
