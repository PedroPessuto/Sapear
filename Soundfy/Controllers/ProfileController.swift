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
    
    init (actualPhase: UUID = UUID(uuidString: "6ba7b810-9dad-11d1-80b4-00c04fd430c8")!, phasesDone: [UUID] = [UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000")!]) {
        self.actualPhase = actualPhase
        self.phasesDone = phasesDone
    }
}

