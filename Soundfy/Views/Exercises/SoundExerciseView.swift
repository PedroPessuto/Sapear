//
//  SoundExerciseView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 29/09/23.
//

import SwiftUI

struct SoundExerciseView: View {
    
    @EnvironmentObject var profileController: ProfileController
    var exercise: Exercise
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var count: Int
    var changeScreen: () -> Void
    var buttonText: String
    
    var body: some View {
        VStack {
            
            // ===== BODY =====
            Spacer()
            VStack (spacing: 20) {
                Text(exercise.exerciseName)
                    .font(.largeTitle)
                    .bold()
                
                Text("Que som é esse?")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(exercise.exerciseDescription)
                    .font(.title2)
                    .fontWeight(.medium)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    if let soundExercise = profileController.actualPhase.phaseExercises[count] as? SoundExercise {
                        ForEach(soundExercise.exerciseAlternatives.indices, id: \.self) { item in
                            SoundAlternativeButton(item: soundExercise.exerciseAlternatives[item], exerciseAnswer: soundExercise.exerciseAnswer, number: item)
                        }
                    }
                }
            }
            
            // ===== FOOTER =====
            Spacer()
            Spacer()
            Spacer()
            PlayButton(buttonAction: {changeScreen()}, buttonText: buttonText)
        }
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}
