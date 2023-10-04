//
//  ProfileController.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import Foundation
import SwiftUI

class ProfileController: ObservableObject {
    @Published var actualPhase: Phase
    @Published var phasesDone: [UUID]
    
    
    
    init (actualPhase: Phase = Phase(
        phaseId: UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000")!,
        phaseName: "Fase 1", phaseLessons: [
            SoundLesson(
                lessonName: "Aula 1",
                lessonDescription: "Descrição da aula 1",
                lessonType: "soundClass",
                lessonAlternatives: [
                    Alternative(alternativeLabel: "Chuva", alternativeSoundName: "Chuva"),
                    Alternative(alternativeLabel: "Raio", alternativeSoundName: "Raio"),
                    Alternative(alternativeLabel: "Vento", alternativeSoundName: "Vento"),
                    Alternative(alternativeLabel: "Explosão", alternativeSoundName: "Explosão")
                ]),
            SoundLesson(lessonName: "Aula 2", lessonDescription: "Descrição da aula 2", lessonType: "soundClass", lessonAlternatives: [
                Alternative(alternativeLabel: "Chuva2", alternativeSoundName: "Chuva2"),
                Alternative(alternativeLabel: "Raio2", alternativeSoundName: "Raio2"),
                Alternative(alternativeLabel: "Vento2", alternativeSoundName: "Vento2"),
                Alternative(alternativeLabel: "Explosão2", alternativeSoundName: "Explosão2")
            ])
        ]), phasesDone: [UUID] = []) {
            self.actualPhase = actualPhase
            self.phasesDone = phasesDone
            
            
        }
}

