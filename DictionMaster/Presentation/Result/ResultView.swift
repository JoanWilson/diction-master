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
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    ResultHeaderView(
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
                        dismiss()
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                )
                .frame(height: 64)
                .buttonStyle(.primary)
                .padding(.init(top: 20, leading: 17, bottom: 31, trailing: 18))
            }
        }
    }
}
