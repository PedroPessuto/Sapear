//
//  ProfileController.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import Foundation

class ProfileController: ObservableObject {
    @Published var actualPhase: Phase?
    @Published var phasesDone: [UUID]
    @Published var onPhase: Bool
    @Published var actualPhaseId: UUID {
        didSet {
            saveActualPhaseId()
        }
    }
    
    @Published var soundsExercisesDone: Double {
        didSet {
            saveDoubleValue(soundsExercisesDone, forKey: soundsExercisesDoneKey)
        }
    }
    
    @Published var soundsExercisesRight: Double {
        didSet {
            saveDoubleValue(soundsExercisesRight, forKey: soundsExercisesRightKey)
        }
    }
    
    @Published var phonemeExercisesDone: Double {
        didSet {
            saveDoubleValue(phonemeExercisesDone, forKey: phonemeExercisesDoneKey)
        }
    }
    
    @Published var phonemeExercisesRight: Double {
        didSet {
            saveDoubleValue(phonemeExercisesRight, forKey: phonemeExercisesRightKey)
        }
    }
    
    @Published var wordsExercisesDone: Double {
        didSet {
            saveDoubleValue(wordsExercisesDone, forKey: wordsExercisesDoneKey)
        }
    }
    
    @Published var wordsExercisesRight: Double {
        didSet {
            saveDoubleValue(wordsExercisesRight, forKey: wordsExercisesRightKey)
        }
    }
    
    private let actualPhaseIdKey = "actualPhaseIdKey"
    
    private let soundsExercisesDoneKey = "soundsExercisesDoneKey"
    private let soundsExercisesRightKey = "soundsExercisesRightKey"
    
    private let phonemeExercisesDoneKey = "phonemeExercisesDoneKey"
    private let phonemeExercisesRightKey = "phonemeExercisesRightKey"
    
    private let wordsExercisesDoneKey = "wordsExercisesDoneKey"
    private let wordsExercisesRightKey = "wordsExercisesRightKey"

    init (actualPhase: Phase? = nil, phasesDone: [UUID] = [], onPhase: Bool = false, actualPhaseId: UUID = UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000")!) {

       
        self.soundsExercisesDone = UserDefaults.standard.double(forKey: soundsExercisesDoneKey)
        self.soundsExercisesRight = UserDefaults.standard.double(forKey: soundsExercisesRightKey)
        self.phonemeExercisesDone = UserDefaults.standard.double(forKey: phonemeExercisesDoneKey)
        self.phonemeExercisesRight = UserDefaults.standard.double(forKey: phonemeExercisesRightKey)
        self.wordsExercisesDone = UserDefaults.standard.double(forKey: wordsExercisesDoneKey)
        self.wordsExercisesRight = UserDefaults.standard.double(forKey: wordsExercisesRightKey)
        
        self.actualPhase = actualPhase
        self.phasesDone = phasesDone
        self.onPhase = onPhase
        self.actualPhaseId = actualPhaseId
        
        loadActualPhaseId()

    }
        
    private func saveActualPhaseId() {
        let defaults = UserDefaults.standard
        defaults.setValue(actualPhaseId.uuidString, forKey: actualPhaseIdKey)
    }
    
    private func loadActualPhaseId() {
        let defaults = UserDefaults.standard
        if let savedIdString = defaults.string(forKey: actualPhaseIdKey),
           let savedId = UUID(uuidString: savedIdString) {
            self.actualPhaseId = savedId
        }
    }
    
    private func saveDoubleValue(_ value: Double, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
