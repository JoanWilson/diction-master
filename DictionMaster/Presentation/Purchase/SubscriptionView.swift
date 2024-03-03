//
//  SubscriptionView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/03/24.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        VStack {
            SubscriptionHeader()
                .background(.red)

            SubscriptionBody()
                .padding(.horizontal, 23)
                .padding(.top, 30)
            Spacer()
            
            SubscriptionFooter()
                .padding(.horizontal, 23)
                .padding(.vertical, 16)

            Button(
                "SUBSCRIBE",
                action: {
                    withAnimation {
//                        isFullScreenViewVisible = false
                    }
//                    viewModel.resetUserCredit()
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                }
            )
            .id(1)
            .frame(height: 64)
            .buttonStyle(.primary)
            .padding(.init(top: 0, leading: 18, bottom: 36, trailing: 17))

        }.ignoresSafeArea(edges: .top)
    }
}

#Preview {
    SubscriptionView()
}
