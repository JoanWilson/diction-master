//
//  ResultViewModel.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import Foundation
import Domain
import AVFoundation

extension ResultView {
    internal final class ViewModel: ObservableObject {
        @Published private var player: AVPlayer? = AVPlayer()
        @Published var invalidPlayer: Bool = false
        let model: ResultWordDefinition
        
        init(model: ResultWordDefinition) {
            self.model = model
        }
        
        func playSound() {
            guard let url = URL(string: model.audioURLStr) else {
                invalidPlayer.toggle()
                return
            }
            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            player?.play()
        }
    }
}
