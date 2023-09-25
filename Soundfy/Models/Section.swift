//
//  Section.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 22/09/23.
//


import Foundation
import SwiftUI

class Section {
    let sectionId: UUID
    let sectionName: String
    let sectionDescription: String
    let sectionPhases: [Phase]

    init(sectionId: UUID = UUID(), sectionName: String, sectionDescription: String, sectionPhases: [Phase]) {
        self.sectionId = sectionId
        self.sectionName = sectionName
        self.sectionDescription = sectionDescription
        self.sectionPhases = sectionPhases
    }
}
