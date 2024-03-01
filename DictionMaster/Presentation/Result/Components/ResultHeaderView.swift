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
                    ProgressView()
                        .tint(Color("color/white"))
                        .modifier(PlayButton())
                } else {
                    Button {
                        playSound()
                    } label: {
                        Image("icon/speaker")
                            .resizable()
                            .modifier(PlayButton())
                    }
                }

                Text("\(subtitle)")
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundStyle(Color("color/deep_blue").opacity(0.4))
            }
        }
    }
}

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
