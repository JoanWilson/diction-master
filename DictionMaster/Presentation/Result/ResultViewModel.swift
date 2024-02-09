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
        let model: [WordDefinition]
        
        init(model: [WordDefinition]) {
            self.model = model
        }
        
        func playSound() {
            guard let url = URL(string: getModel().audioURLStr) else {
                invalidPlayer.toggle()
                return
            }
            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            player?.play()
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
