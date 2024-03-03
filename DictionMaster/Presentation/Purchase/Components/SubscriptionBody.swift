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
        }
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
        attrString.font = .system(.title3, design: .rounded, weight: .bold)
        attrString.foregroundColor = Color("color/deep_blue")
        
        return attrString
    }
    
    private func makePrimaryBoldText(_ str: String) -> AttributedString {
        var attrString = AttributedString(str)
        attrString.font = .system(.title3, design: .rounded, weight: .bold)
        attrString.foregroundColor = Color("color/primary")
        
        return attrString
    }
    
    private func makePrimaryText(_ str: String) -> AttributedString {
        var attrString = AttributedString(str)
        attrString.font = .system(.title3, design: .rounded, weight: .bold)
        attrString.foregroundColor = Color("color/primary")
        
        return attrString
    }
}
