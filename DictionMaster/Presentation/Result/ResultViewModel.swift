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
        @Published var audioLoading: Bool = false
        let model: ResultWordDefinition
        
        init(model: ResultWordDefinition) {
            self.model = model
        }
        
        func playSound() {
            DispatchQueue.main.async {
                self.audioLoading = true
            }

            DispatchQueue.main.async {
                guard let url = URL(string: self.model.audioURLStr) else {
                    DispatchQueue.main.async {
                        self.invalidPlayer.toggle()
                        self.audioLoading = false
                    }
                    return
                }

                DispatchQueue.main.async {
                    let playerItem = AVPlayerItem(url: url)
                    self.player = AVPlayer(playerItem: playerItem)

                    NotificationCenter.default.addObserver(
                        self,
                        selector: #selector(self.audioFinishedPlaying),
                        name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                        object: playerItem
                    )

                    self.player?.play()
                }
            }
        }

        @objc func audioFinishedPlaying(note: NSNotification) {
            DispatchQueue.main.async {
                self.audioLoading = false
            }
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        }
    }
}
