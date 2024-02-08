//
//  Phonetic.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public struct Phonetic: Codable {
    public let text: String?
    public let audio: String?
    
    public init(text: String?, audio: String?) {
        self.text = text
        self.audio = audio
    }
}
