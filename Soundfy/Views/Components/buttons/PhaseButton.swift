//
//  PhaseButton.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//


import SwiftUI

struct PhaseButton: View {
    
    @EnvironmentObject var profileController: ProfileController
    @FetchRequest(entity: PhaseCoreData.entity(), sortDescriptors: []) var phasesDone: FetchedResults<PhaseCoreData>
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var phasesDone: FetchedResults<PhaseCoreData>
    
    @State var isDone: Bool = false
    var phase: Phase
    
    func checkIsDone() -> Void {
        for phaseCD in phasesDone {
                
            if phaseCD.id == phase.phaseId {
                isDone = true
                break
            }
        }
    }
    
    var body: some View {
        
        Button (action: {
            profileController.onPhase = true
            profileController.actualPhase = phase
            profileController.actualPhaseId = phase.phaseId
            
        }) {
            
            if phase.phaseId == profileController.actualPhase?.phaseId {
                Image("lilypad3")
                    .resizable()
                    .frame(width: 190, height: 150)
                    .accessibilityLabel(Text("Fase atual"))
                    
                   
                
            } else {
                Image(isDone ? "lilypad2" : "lilypad")
                    .resizable()
                    .frame(width: 190, height: 100)
                    .accessibilityLabel(isDone ? Text("Fase concluída") : Text("Fase"))
                  
            }
            
        }
       
        .onAppear {
            checkIsDone()
        }
        .onChange(of: profileController.phasesDone) { _ in
            checkIsDone()
        }
    }
}

