//
//  PhaseButton.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//


import SwiftUI

struct PhaseButton: View {
    
    @EnvironmentObject var primaryController: PrimaryController
    @EnvironmentObject var profileController: ProfileController
    @State var isDone: Bool = false
    var phase: Phase
    
    func checkIsDone() -> Void {
        for id in profileController.phasesDone {
            if id == phase.phaseId {
                isDone = true
                break
            }
        }
    }
    
    var body: some View {
        
        Button (action: {
            primaryController.onPhase = true
            profileController.actualPhase = phase
        }) {
            if phase.phaseId == profileController.actualPhase.phaseId {
                Image("lilypad3")
            } else {
                Image(isDone ? "lilypad2" : "lilypad")
            }
        }
        .frame(width: 190, height: 100)
        .onAppear {
            checkIsDone()
        }
        .onChange(of: profileController.phasesDone) { _ in
            checkIsDone()
        }
    }
}
