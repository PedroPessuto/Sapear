//
//  Exercise.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//

import Foundation

protocol Exercise {
    var exerciseId: UUID { get }
    var exerciseName: String { get set }
    var exerciseDescription: String { get set }
    var exerciseType: String { get set }
}

class SoundExercise: Exercise {
    var exerciseId: UUID
    var exerciseName: String
    var exerciseDescription: String
    var exerciseType: String
    var exerciseAlternatives: [Alternative]
    var exericseAwnser: Int

    init(exerciseId: UUID = UUID(), exerciseName: String, exerciseDescription: String, exerciseType: String, exerciseAlternatives: [Alternative], exericseAwnser: Int) {
        self.exerciseId = exerciseId
        self.exerciseName = exerciseName
        self.exerciseDescription = exerciseDescription
        self.exerciseType = exerciseType
        self.exerciseAlternatives = exerciseAlternatives
        self.exericseAwnser = exericseAwnser
    }
}
