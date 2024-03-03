//
//  SubscriptionView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/03/24.
//

import SwiftUI

struct SubscriptionView: View {
    @StateObject var viewModel: ViewModel
    @Binding var isFullScreenCoverPresented: Bool
    @Binding var isFullScreenViewVisible: Bool

    var body: some View {
        Group {
            if isFullScreenViewVisible {
                VStack {
                    GeometryReader { proxy in
                        Image("image/purchase")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: proxy.size.height, alignment: .bottom)
                            .clipped()
                    }

                    SubscriptionBody()
                        .padding(.horizontal, 23)
                    Spacer()

                    SubscriptionFooter()
                        .padding(.horizontal, 23)
                        .padding(.vertical, 16)

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
                    .padding(
                        .init(
                            top: 0,
                            leading: 18,
                            bottom: 36,
                            trailing: 17
                        )
                    )

                }
                .ignoresSafeArea(edges: .top)
                .onDisappear {
                    isFullScreenCoverPresented = false
                }
            }
        }
        .onAppear {
            isFullScreenViewVisible = true
        }
    }
}
