//
//  SearchView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//
//
import SwiftUI
import Domain

struct SearchView: View {
    @StateObject var viewModel: ViewModel
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        NavigationStack {
            VStack {
                FlagView(language: .english)
                    .padding(.bottom, UIScreen.screenHeight * 0.2)

                InputWord(
                    text: $viewModel.text,
                    isTextfieldFocused: _isTextFieldFocused,
                    placeholder: "Type your word.."
                )

                Spacer()

                SearchButton(isLoading: $viewModel.isLoading, text: $viewModel.text) {
                    viewModel.isLoading.toggle()
                    Task {
                        viewModel.searchWord(word: viewModel.text)
                    }
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                }
            }
            .alert("Couldn't find that word.", isPresented: $viewModel.showAlert, actions: {
                Button("OK", role: .cancel) {
                    viewModel.showAlert.toggle()
                }
            })
            .fullScreenCover(isPresented: $viewModel.isPurchaseViewPresented) {
                AppFactory.makeSubscriptionView(
                    isFullScreenCoverPresented: $viewModel.isPurchaseViewPresented,
                    isFullScreenViewVisible: $viewModel.isPurchaseViewVisible
                )
            }
            .fullScreenCover(isPresented: $viewModel.isFullScreenCoverPresented) {
                ResultView(
                    viewModel: ResultView.ViewModel(
                        model: self.viewModel.convertToResultWordDefinition(viewModel.wordDefinitionFound[0])
                    ), isFullScreenCoverPresented: $viewModel.isFullScreenCoverPresented, isFullScreenViewVisible: $viewModel.isFullScreenViewVisible
                )
            }
            .transaction({ transaction in
                if viewModel.appearingCount > 1 {
                    transaction.disablesAnimations = true
                    transaction.animation = .linear(duration: 0.2)
                } else {
                    viewModel.appearingCount += 1
                }
            })
            .onChange(of: viewModel.isFullScreenCoverPresented || viewModel.isPurchaseViewPresented || viewModel.showAlert, { _, newValue in
                if !newValue {
                    viewModel.text = ""
                    isTextFieldFocused = true
                }
            })
            .padding(.init(top: 75, leading: 18, bottom: 20, trailing: 17))
            .onAppear {
                viewModel.text = ""
                isTextFieldFocused = true
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
