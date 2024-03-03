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
            ZStack(alignment: .bottom) {
                GeometryReader { geometry in
                    Image("image/girl_checks_mobile")

                    Image("image/splashLogo")
                        .resizable()
                        .frame(
                            width: UIScreen.screenWidth * 0.35,
                            height: UIScreen.screenWidth * 0.35
                        )
                        .position(
                            x: geometry.size.width / 2

                        )
                }
            }
            .background(Color.red)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SubscriptionHeader()
}
