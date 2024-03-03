//
//  ContentView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AppFactory.makeBuildApp()
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
