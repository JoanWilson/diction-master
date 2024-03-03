//
//  SubscriptionHeader.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 03/03/24.
//

import SwiftUI

struct SubscriptionFooter: View {
    var body: some View {
        Text(callToActionText())
            .multilineTextAlignment(.center)
    }

    private func callToActionText() -> AttributedString {
        var attrStr = AttributedString()
        attrStr += makeCalloutText("Try 7 Days Free, ", weight: .bold)
        attrStr += makeCalloutText("then only ", weight: .regular)
        attrStr += makeCalloutText("$19,99 ", weight: .bold)
        attrStr += makeCalloutText("per year. \nCancel anytime.", weight: .regular)

        return attrStr
    }

    private func makeCalloutText(_ str: String, weight: Font.Weight) -> AttributedString {
        var attrStr = AttributedString(str)
        attrStr.font = .system(.callout, design: .rounded, weight: weight)
        attrStr.foregroundColor = Color("color/deep_blue")

        return attrStr
    }
}
