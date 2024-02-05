//
//  PurchaseView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct PurchaseView: View {
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView {
                VStack {
                    PurchaseHeader()
                    PurchaseBody()
                    
                    Button(
                        "SUBSCRIBE",
                        action: {
                            print("itsGood")
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        }
                    )
                    .id(1)
                    .frame(height: 64)
                    .buttonStyle(.primary)
                    .padding(.init(top: 0, leading: 18, bottom: 36, trailing: 17))
                }
            }
            .ignoresSafeArea(edges: [.top, .horizontal])
            .scrollBounceBehavior(.basedOnSize)
            .onAppear {
                scrollProxy.scrollTo(1, anchor: .bottom)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PurchaseView()
}
