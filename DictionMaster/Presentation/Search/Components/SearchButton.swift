//
//  SearchButton.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 16/02/24.
//

import SwiftUI

struct SearchButton: View {
    @Binding var isLoading: Bool
    @Binding var text: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isLoading {
                Button {} label: {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(Color("color/white"))
                }
                .buttonStyle(.primary)
                .disabled(true)
            } else {
                if !text.isEmpty {
                    Button(
                        "SEARCH",
                        action: { action() }
                    )
                    .buttonStyle(.primary)
                }
            }
        }
    }
}
