//
//  ProfileController.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import Foundation

class ProfileController: ObservableObject {
    @Published var actualPhase: UUID
    @Published var phasesDone: [UUID]
    
    init (actualPhase: UUID = UUID(uuidString: "6ba7b810-9dad-11d1-80b4-00c04fd430c8")!, phasesDone: [UUID] = []) {
        self.actualPhase = actualPhase
        self.phasesDone = phasesDone
    }
}

