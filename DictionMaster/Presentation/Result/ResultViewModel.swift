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
        let model: [WordDefinition]
        
        init(model: [WordDefinition]) {
            self.model = model
        }
        
        func playSound() {
            DispatchQueue.main.async {
                self.audioLoading = true
            }

            DispatchQueue.main.async {
                guard let url = URL(string: self.getModel().audioURLStr) else {
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

        private func convertToResultWordDefinition(_ wordDefinition: WordDefinition) -> ResultWordDefinition {
            guard let word = wordDefinition.word else {
                return ResultWordDefinition(title: "", phonetic: "", audioURLStr: "", definitions: [])
            }
            
            let phoneticText = wordDefinition.phonetics?.first(where: { $0.text != nil })?.text ?? wordDefinition.phonetic ?? ""
            let audioURLStr = wordDefinition.phonetics?.first { phonetic in
                if let audio = phonetic.audio {
                    return audio.count > 5
                }
                return false
            }?.audio ?? ""
            
            let definitions = wordDefinition.meanings?.compactMap { meaning -> [ResultDefinition] in
                meaning.definitions?.map { definition -> ResultDefinition in
                    ResultDefinition(
                        partOfSpeech: meaning.partOfSpeech ?? "",
                        definition: definition.definition ?? "",
                        example: definition.example ?? ""
                    )
                } ?? []
            }.flatMap { $0 } ?? []
            
            return ResultWordDefinition(
                title: word,
                phonetic: phoneticText,
                audioURLStr: audioURLStr,
                definitions: definitions
            )
        }

        public func getModel() -> ResultWordDefinition {
            return convertToResultWordDefinition(model[0])
        }
    }
}
