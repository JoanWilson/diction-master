//
//  PurchaseHeader.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 05/02/24.
//

import SwiftUI

struct PurchaseHeader: View {
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                ZStack(alignment: .top) {
                    Image("image/girl_checks_mobile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    VStack {
                        Spacer()
                        Image("image/logo")
                            .shadow(color: Color("color/deep_blue").opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }.offset(x: 0, y: 64)
                }
                .frame(minHeight: 465)
            }
            
            VStack {
                Image("image/logoname")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 188.42)
                    .padding(.top, 44)
            }
        }.clipped()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PurchaseHeader()
}
