//
//  Phase.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 22/09/23.
//

import Foundation

class Phase {
    var phaseId: UUID
    var phaseName: String
    var phaseLessons: [Lesson]
    var phaseExercises: [Exercise]
    
    init(phaseId: UUID = UUID(), phaseName: String, phaseLessons: [Lesson], phaseExercises: [Exercise] = []) {
        self.phaseId = phaseId
        self.phaseName = phaseName
        self.phaseLessons = phaseLessons
        self.phaseExercises = phaseExercises
    }
}
