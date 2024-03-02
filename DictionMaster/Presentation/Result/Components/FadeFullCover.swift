//
//  FadeFullCover.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/03/24.
//

import SwiftUI

struct FadeFullCover: View {
  @StateObject var viewModel = ViewModel()

  var body: some View {
    VStack {
      Button("Show Full-Screen Modal") {
          viewModel.isFullScreenCoverPresented = true
      }
    }.fullScreenCover(isPresented: $viewModel.isFullScreenCoverPresented) {
        Sheet(isFullScreenCoverPresented: $viewModel.isFullScreenCoverPresented, isFullScreenViewVisible: $viewModel.isFullScreenViewVisible)
//      Group {
//          if viewModel.isFullScreenViewVisible {
//                VStack {
//                  Button("Dismiss") {
//                      viewModel.isFullScreenViewVisible = false
//                  }
//                  .frame(maxWidth: .infinity, maxHeight: .infinity)
//                  .background(.yellow)
//                }
//                .onDisappear {
//                    viewModel.isFullScreenCoverPresented = false
//                }
//
//        }
//      }
//      .onAppear {
//          viewModel.isFullScreenViewVisible = true
//      }
    }
    .transaction({ transaction in
        transaction.disablesAnimations = true
        transaction.animation = .linear(duration: 0.2)
    })
  }
}

extension FadeFullCover {
    class ViewModel: ObservableObject {
        @Published var isFullScreenCoverPresented = false
        @Published var isFullScreenViewVisible = false
    }
}

struct Sheet: View {
    @Binding var isFullScreenCoverPresented: Bool
    @Binding var isFullScreenViewVisible: Bool

    var body: some View {
        Group {
          if isFullScreenViewVisible {
                  VStack {
                    Button("Dismiss") {
                        isFullScreenViewVisible = false
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.yellow)
                  }
                  .onDisappear {
                    isFullScreenCoverPresented = false
                  }

          }
        }
        .onAppear {
          isFullScreenViewVisible = true
        }
    }
}
