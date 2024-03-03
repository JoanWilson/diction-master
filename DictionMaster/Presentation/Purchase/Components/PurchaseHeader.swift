//
//  PurchaseHeader.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct SubscriptionHeader: View {
    var body: some View {
        VStack {
            Image("image/girl_checks_mobile")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                .aspectRatio(contentMode: .fill)
            VStack {
                Image("image/splashLogo")
                    .resizable()
                    .frame(width: 138, height: 138)
                Image("image/logoname")
                    .resizable()
                    .frame(width: 188.43, height: 32)
                    .offset(y: -23)
            }
            .offset(y: -75)
        }
        .scaledToFit()
        .frame(minHeight: 250, maxHeight: 500)
    }
}


#Preview {
    SubscriptionHeader()
}
