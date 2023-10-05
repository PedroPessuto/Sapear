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
    
    @State var exerciseAwnser: Int = -1
    @State var buttonText: String = "Confirmar"
    @State var gotRight: Bool = false
    @State var selectedOption: Int = -1
    @State var waringText: String = ""
    @State var clickedAlternatives: [UUID] = []
    @State var selectedOptionId: UUID = UUID()
    
    func handleNextScreen() {
        // Funcionamento de próxima tela
    
        
        // Se já acertou prox tela
        if gotRight {
            changeScreen()
            buttonText = "Confirmar"
            gotRight = false
            selectedOption = -1
            waringText = ""
            clickedAlternatives = []
            selectedOptionId = UUID()
            
            
        }
        
        // Verifica se acertou
        if selectedOption == exerciseAwnser {
            
            gotRight = true
            waringText = "Parabéns"
            buttonText = "Próximo"
            
        }
        
        // Verifica se errou
        if selectedOption != exerciseAwnser && selectedOption != -1 {
            waringText = "Tente Novamente"
        }
        
        if !clickedAlternatives.contains(selectedOptionId) {
            clickedAlternatives.append(selectedOptionId)
        }
        
    }
    
    var body: some View {
        VStack {
            
            // ===== BODY =====
            Spacer()
            VStack (spacing: 20) {
                Text(exercise.exerciseName)
                    .font(Font.custom("Quicksand-Bold", size: 40,relativeTo: .largeTitle))
                    .bold()
                
                Text(exercise.exerciseDescription)
                    .font(.title2)
                    .fontWeight(.medium)
                
                SoundButton(buttonAction: {})
               
                LazyVGrid(columns: columns, spacing: 20) {
                    if let soundExercise = profileController.actualPhase!.phaseExercises[count] as? SoundExercise {
                        ForEach(soundExercise.exerciseAlternatives.indices, id: \.self) { item in
                            ExerciseSoundButton(item: soundExercise.exerciseAlternatives[item], exerciseAnswer: soundExercise.exerciseAnswer, number: item, selectedOption: $selectedOption, selectedOptionId: $selectedOptionId, clickedAlternatives: $clickedAlternatives)
                        }
                    }
                }
            }
            
            // ===== FOOTER =====
            Spacer()
            Spacer()
            Spacer()
            Text(waringText)
                .frame(height: 15)
                .padding(.bottom)
            PlayButton(buttonAction: {handleNextScreen()}, buttonText: buttonText)
        }
        .onAppear {
            if let soundExercise = profileController.actualPhase!.phaseExercises[count] as? SoundExercise {
                exerciseAwnser = soundExercise.exerciseAnswer
            }
        }
        .onChange(of: count, perform: { newValue in

            if let soundExercise = profileController.actualPhase.phaseExercises[count+1] as? SoundExercise {
                exerciseAwnser = soundExercise.exerciseAnswer
            }

        })
        
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}
