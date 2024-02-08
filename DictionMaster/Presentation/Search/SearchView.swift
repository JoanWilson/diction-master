////
////  SearchView.swift
////  DictionMaster
////
////  Created by Joan Wilson Oliveira on 05/02/24.
////
//
import SwiftUI
import Domain

struct SearchView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            FlagView(language: .english)
            Spacer()
            InputWord(text: $viewModel.text, placeholder: "Type your word..")
            Spacer()
            if !viewModel.text.isEmpty {
                Button(
                    "SEARCH",
                    action: {
                        Task {
                            viewModel.searchWord(word: viewModel.text)
                        }
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                )
                .buttonStyle(.primary)
            }
        }
        .alert("Error", isPresented: $viewModel.showAlert, actions: {
            Button("OK", role: .cancel) {
                viewModel.showAlert.toggle()
            }
        })
        .fullScreenCover(isPresented: $viewModel.mustBuySubscription, content: {
            PurchaseView()
        })
        .fullScreenCover(isPresented: $viewModel.showResultView, content: {
            ResultView(model: viewModel.getResultWordDefinition())
        })
        .padding(.init(top: 75, leading: 18, bottom: 20, trailing: 17))
    }
}
