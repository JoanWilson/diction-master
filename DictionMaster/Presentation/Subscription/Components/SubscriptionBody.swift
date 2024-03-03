//
//  PurchaseBody.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct SubscriptionBody: View {
    var body: some View {
        VStack {
            Text(subscribeText())
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .minimumScaleFactor(1)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }

    private func subscribeText() -> AttributedString {
        var attrStr = AttributedString()
        attrStr += makeDeepBlueBoldText("Subscribe now to get ")
        attrStr += makePrimaryBoldText("unlimited ")
        attrStr += makeDeepBlueBoldText("searches and full access to ")
        attrStr += makePrimaryBoldText("all features.")

        return attrStr
    }

    private func makeDeepBlueBoldText(_ str: String) -> AttributedString {
        var attrString = AttributedString(str)
        attrString.foregroundColor = Color("color/deep_blue")

        return attrString
    }

    private func makePrimaryBoldText(_ str: String) -> AttributedString {
        var attrString = AttributedString(str)
        attrString.foregroundColor = Color("color/primary")

        return attrString
    }

    private func makePrimaryText(_ str: String) -> AttributedString {
        var attrString = AttributedString(str)
        attrString.foregroundColor = Color("color/primary")

        return attrString
    }
}
