//
//  Exercise.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//

import Foundation

class Exercise {
    var exerciseId: UUID
    var exerciseName: String
    var exerciseDescription: String
    var exerciseType: String
    var exerciseAlternatives: [Alternative]
    var exerciseAnswer: Int

    init(exerciseId: UUID = UUID(), exerciseName: String, exerciseDescription: String, exerciseType: String, exerciseAlternatives: [Alternative], exerciseAnswer: Int) {
        self.exerciseId = exerciseId
        self.exerciseName = exerciseName
        self.exerciseDescription = exerciseDescription
        self.exerciseType = exerciseType
        self.exerciseAlternatives = exerciseAlternatives
        self.exerciseAnswer = exerciseAnswer
    }
}
