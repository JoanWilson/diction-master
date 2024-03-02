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
                
                Spacer()
                
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
            .fullScreenCover(isPresented: $viewModel.mustBuySubscription, content: {
                AppFactory.makePurchaseView()
            })
            .fullScreenCover(isPresented: $viewModel.showResultView, content: {
                ResultView(
                    viewModel: ResultView.ViewModel(
                        model: viewModel.wordDefinitionFound
                    )
                )   
            })
            .onChange(of: viewModel.showResultView, { _, newValue in
                if !newValue {
                    viewModel.text = ""
                    isTextFieldFocused = true
                }
            })
            .padding(.init(top: 75, leading: 18, bottom: 20, trailing: 17))

        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
