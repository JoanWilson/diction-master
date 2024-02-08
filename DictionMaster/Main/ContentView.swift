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
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            AppFactory.makeBuildApp()
        }
    }
}

#Preview {
    ContentView()
}
