//
//  FineshedView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 29/09/23.
//

import SwiftUI

struct FineshedView: View {
    
    @EnvironmentObject var profileController: ProfileController
    @EnvironmentObject var progressionController: ProgressionController
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    var changeScreen: () -> Void
    
    var body: some View {
        VStack {
            
            // ===== BODY =====
            Spacer()
            VStack (spacing: 20) {
                Text("Nível Concluído")
                    .font(.largeTitle)
                    .bold()
                
                Image("frog_fineshed")
                
                Text("Parabéns!")
                    .font(.title)
                    .bold()
                    .fontWeight(.medium)
                
                Text("Você pegou o jeito, continue jogando para aprender mais.")
                    .fontWeight(.medium)
                    .font(.title3)
                
            }
            
            // ===== FOOTER =====
            Spacer()
            Spacer()
            PlayButton(buttonAction: {
                changeScreen()
                progressionController.addPhaseDone(id: profileController.actualPhase!.phaseId , context: managedObjContext)
                profileController.phasesDone.append(profileController.actualPhase!.phaseId)
                profileController.onPhase = false
            }, buttonText: "Concluir")
        }
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}

