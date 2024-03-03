//
//  ResultHeaderView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import Domain
import SwiftUI
import AVFoundation

struct ResultHeaderView: View {
    @Binding var audioLoading: Bool
    let title: String
    let subtitle: String
    let playSound: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            Text(title.capitalized)
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .foregroundStyle(Color("color/deep_blue"))

            HStack {
                if audioLoading {
                    Image(systemName: "waveform")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .symbolEffect(
                            .variableColor
                            .iterative
                            .hideInactiveLayers
                            .reversing,
                            options: .repeating
                        )
                        .modifier(PlayingButton())
                } else {
                    Button {
                        playSound()
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    } label: {
                        Image("icon/speaker")
                            .resizable()
                            .modifier(PlayButton())
                    }
                    .buttonStyle(ScaleEffectButtonStyle())
                }

                Text("\(subtitle)")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundStyle(Color("color/deep_blue").opacity(0.4))
            }
        }
    }
}
                   
