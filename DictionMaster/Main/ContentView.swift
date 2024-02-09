//
//  ContentView.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import SwiftUI
import Domain
import Data
import Infrastructure
import Security

struct ContentView: View {
    var body: some View {
        AppFactory.makeBuildApp()
    }
}

#Preview {
    ContentView()
}
