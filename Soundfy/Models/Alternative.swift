//
//  Alternative.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//

import Foundation

class Alternative {
    var alternativeId: UUID
    var alternativeLabel: String
    var alternativeSoundName: String
    
    init(alternativeId: UUID = UUID(), alternativeLabel: String, alternativeSoundName: String) {
        self.alternativeId = alternativeId
        self.alternativeLabel = alternativeLabel
        self.alternativeSoundName = alternativeSoundName
    }
}
