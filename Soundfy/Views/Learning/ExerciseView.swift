//
//  SoundExerciseView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 29/09/23.
//

import SwiftUI
import AVFoundation

struct ExerciseView: View {
    
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
    @State var buttonDisabled: Bool = true
    @State var palavraescrita: String = "B"
    @State var isTalking: Bool = false
    @State var isFirst: Bool = true
    
    @State private var hasBeenRead = false


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
    
    func getSound() -> String {
        return exercise.exerciseAlternatives[exercise.exerciseAnswer].alternativeSoundName ?? ""
    }
    
    func handleNextScreen() {
        
        // Se já acertou prox tela
        if gotRight {
            changeScreen()
            buttonText = "Confirmar"
            gotRight = false
            selectedOption = -1
            waringText = ""
            clickedAlternatives = []
            selectedOptionId = UUID()
            isFirst = true
            
            if exercise.exerciseType == "soundExercise" {
                profileController.soundsExercisesDone = profileController.soundsExercisesDone + 1
            }
            else if exercise.exerciseType == "phonemeExercise" {
                profileController.phonemeExercisesDone = profileController.phonemeExercisesDone + 1
            }
            else {
                profileController.wordsExercisesDone = profileController.wordsExercisesDone + 1
            }
        }
        
        // Verifica se acertou
        if selectedOption == exerciseAwnser {
            
            gotRight = true
            waringText = "Parabéns"
            buttonText = "Próximo"
            
            if isFirst{
                if exercise.exerciseType == "soundExercise" {
                    profileController.soundsExercisesRight = profileController.soundsExercisesRight + 1
                    
                }
                else if exercise.exerciseType == "phonemeExercise" {
                    profileController.phonemeExercisesRight = profileController.phonemeExercisesRight + 1
                }
                else {
                    profileController.wordsExercisesRight = profileController.wordsExercisesRight + 1
                }
            }
        }
        
        // Verifica se errou
        if selectedOption != exerciseAwnser && selectedOption != -1 {
            waringText = "Tente Novamente"
            isFirst = false
        }
        
        if !clickedAlternatives.contains(selectedOptionId) {
            clickedAlternatives.append(selectedOptionId)
        }
        
    }
    
    var body: some View {
        VStack {
            
            // ===== BODY =====
            VStack (spacing: 20) {
                Text(exercise.exerciseName)
                    .font(Font.custom("Quicksand-Bold", size: 38,relativeTo: .largeTitle))
                    .multilineTextAlignment(.center)
                    .bold()
                    .lineLimit(nil)
                
                Text(exercise.exerciseDescription)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                
                VStack {
                    if exercise.exerciseType == "soundExercise" {
                        SoundButton(buttonAction: {playSound(Nome: getSound())})
                            .accessibilityElement(children: .ignore)
                            .accessibility(label: Text(hasBeenRead ? "" : "Áudio Botão"))
                    }
                    
                    else {
                        FrogTalking(playSound: playSound, getSound: getSound, palavraescrita: $palavraescrita, isDisabled: false, isTalking: $isTalking, type: exercise.exerciseType)
                            .accessibilityElement(children: .ignore)
                            .accessibility(label: Text(hasBeenRead ? "" : "Sapo Botão"))
                    }
                }
                .onTapGesture {
                    hasBeenRead = true
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(exercise.exerciseAlternatives.indices, id: \.self) {
                        number in
                        ExerciseSoundButton(item: exercise.exerciseAlternatives[number], exerciseAnswer: exercise.exerciseAnswer, number: number, buttonAction: {
                            if exercise.exerciseAlternatives[number].alternativeSoundName != nil {
                                playSound(Nome: exercise.exerciseAlternatives[number].alternativeSoundName ?? "")
                            }
                        }, selectedOption: $selectedOption, selectedOptionId: $selectedOptionId, clickedAlternatives: $clickedAlternatives)
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(Text("Alternativa \(exercise.exerciseAlternatives[number].alternativeLabel) Botão"))
                    }
                }
            }
            
            // ===== FOOTER =====
            Spacer()
            
            Text(waringText)
                .frame(height: 15)
                .padding(.bottom)
            
            PlayButton(buttonAction: {handleNextScreen() 
                playSound(Nome: "vazio")}, buttonText: buttonText, isDisabled: $buttonDisabled)
                .onChange(of: selectedOption) { newValue in
                    if selectedOption != -1 {
                        buttonDisabled = false
                    }
                    else {
                        buttonDisabled = true
                    }
                }
               
        }
        .onAppear {
            
            exerciseAwnser = exercise.exerciseAnswer
        }
        .onChange(of: count, perform: { _ in
            let nextExercise: Exercise = profileController.actualPhase!.phaseExercises[count + 1]
            exerciseAwnser = nextExercise.exerciseAnswer
           
        })
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}
