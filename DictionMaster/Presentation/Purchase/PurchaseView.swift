//
//  PurchaseView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct PurchaseView: View {
    @StateObject var viewModel: ViewModel
    @Binding var isFullScreenCoverPresented: Bool
    @Binding var isFullScreenViewVisible: Bool

    var body: some View {
        Group {
            if isFullScreenViewVisible {
                ScrollView {
                    VStack {
                        PurchaseHeader()
                        PurchaseBody()

                        Button(
                            "SUBSCRIBE",
                            action: {
                                withAnimation {
                                    isFullScreenViewVisible = false
                                }
                                viewModel.resetUserCredit()
                                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            }
                        )
                        .id(1)
                        .frame(height: 64)
                        .buttonStyle(.primary)
                        .padding(.init(top: 0, leading: 18, bottom: 36, trailing: 17))
                    }
                    .scrollBounceBehavior(.always)
                    .onDisappear {
                        isFullScreenCoverPresented = false
                    }
                }
                .ignoresSafeArea(edges: [.top, .horizontal])
                .scrollBounceBehavior(.basedOnSize)
            }
        }
        .onAppear {
            isFullScreenViewVisible = true
        }
    }
}
