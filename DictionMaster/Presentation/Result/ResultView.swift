//
// ResultView.swift
// DictionMaster
//
// Created by Joan Wilson Oliveira on 05/02/24.
//

import Domain
import SwiftUI
import AVFoundation

struct ResultView: View {
    @StateObject var viewModel: ViewModel
    @Binding var isFullScreenCoverPresented: Bool
    @Binding var isFullScreenViewVisible: Bool

    var body: some View {
        Group {
            if isFullScreenViewVisible {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            ResultHeaderView(
                                audioLoading: $viewModel.audioLoading,
                                title: viewModel.getModel().title,
                                subtitle: viewModel.getModel().phonetic
                            ) {
                                viewModel.playSound()
                            }
                            .padding(.bottom, 25)
                            .alert("There is no sound available", isPresented: $viewModel.invalidPlayer) {
                                Button("OK", role: .cancel) {
                                    viewModel.invalidPlayer.toggle()
                                }
                            }
                            WordDefinitionsList(definitions: viewModel.getModel().definitions)
                        }
                        .padding(.init(top: 48, leading: 20.5, bottom: 30, trailing: 18))

                        Divider()

                        ResultBottomView(word: viewModel.getModel().title)
                            .padding(.horizontal, 20.5)

                        Spacer()

                        Button(
                            "NEW SEARCH",
                            action: {
                                withAnimation {
                                    isFullScreenViewVisible = false
                                }

                                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            }
                        )
                        .frame(height: 64)
                        .buttonStyle(.primary)
                        .padding(.init(top: 20, leading: 17, bottom: 31, trailing: 18))
                    }
                }
                .scrollBounceBehavior(.always)
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
