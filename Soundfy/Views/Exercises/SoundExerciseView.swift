//
//  SoundExerciseView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 29/09/23.
//

import SwiftUI
import AVFoundation


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
    
    func playSound(Nome: String){
        let url = Bundle.main.url(forResource: Nome, withExtension: "mp3")
        guard url != nil else{
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        }catch{
            print("\(error)")
        }
    }
    
    func getSound() -> String{
        if let soundExercise = profileController.actualPhase!.phaseExercises[count] as? SoundExercise {
            return ExerciseSoundButton(item: soundExercise.exerciseAlternatives[soundExercise.exerciseAnswer], exerciseAnswer: soundExercise.exerciseAnswer, number: soundExercise.exerciseAnswer, buttonAction: {}, selectedOption: $selectedOption,selectedOptionId: $selectedOptionId, clickedAlternatives: $clickedAlternatives).item.alternativeSoundName
        }
        return ""
        
    }
    
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
                    .font(Font.custom("Quicksand-Bold", size: 38,relativeTo: .largeTitle))
                    .bold()
                
                Text(exercise.exerciseDescription)
                    .font(.title2)
                    .fontWeight(.medium)
                
                SoundButton(buttonAction: {playSound(Nome: getSound())})
                
                LazyVGrid(columns: columns, spacing: 20) {
                    if let soundExercise = profileController.actualPhase!.phaseExercises[count] as? SoundExercise {
                        ForEach(soundExercise.exerciseAlternatives.indices, id: \.self) { item in
                            ExerciseSoundButton(item: soundExercise.exerciseAlternatives[item], exerciseAnswer: soundExercise.exerciseAnswer, number: item, buttonAction: {playSound(Nome: soundExercise.exerciseAlternatives[item].alternativeSoundName)}, selectedOption: $selectedOption, selectedOptionId: $selectedOptionId, clickedAlternatives: $clickedAlternatives)
                            
                                
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
            if let soundExercise = profileController.actualPhase!.phaseExercises[count+1] as? SoundExercise {
                exerciseAwnser = soundExercise.exerciseAnswer
            }
        })
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}
