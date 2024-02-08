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
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            FlagView(language: .english)
            Spacer()
            InputWord(text: $text, placeholder: "Type your word..")
            Spacer()
            if !text.isEmpty {
                Button(
                    "SEARCH",
                    action: {
                        Task {
                            viewModel.searchWord(word: text)
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
        .padding(.init(top: 75, leading: 18, bottom: 20, trailing: 17))
    }
}
