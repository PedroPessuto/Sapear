//
//  PhaseView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//


import SwiftUI

struct PhaseView: View {
    
    @EnvironmentObject var profileController: ProfileController
    @State private var isDone: Bool = false
    
    var phase: Phase
    
    var body: some View {
        
        VStack {
            if phase.phaseId == profileController.actualPhase {
                Image("lilypad3")
            } else {
                Image(isDone ? "lilypad2" : "lilypad")
            }
        }
        .frame(width: 190, height: 100)
        .onAppear {
            for id in profileController.phasesDone {
                if id == phase.phaseId {
                    isDone = true
                    break
                }
            }
        }
        
    }
}
