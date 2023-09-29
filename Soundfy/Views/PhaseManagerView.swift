//
//  LessonManagerView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import SwiftUI

struct PhaseManagerView: View {
    
    @EnvironmentObject var profileController: ProfileController
    @EnvironmentObject var primaryController: PrimaryController
    
    @State var progressValue: Float = 0.0
    
    @State var count: Int = 0
    @State var lessonType: String = ""
    @State var exerciseType: String = ""
    @State var lessonsNumber: Int = 0
    @State var exercisesNumber: Int = 0
    @State var actualScreen: String = "lesson"
    @State var buttonText: String = "Próximo"
    
    func changeScreen() -> Void {
        
        // Se tiver em aula
        if (actualScreen == "lesson") {
            // Se tiver aula para fazer
            
            if count != lessonsNumber - 1 {
                count = count + 1
                progressValue = progressValue + (1.0 / Float(lessonsNumber + exercisesNumber))
                lessonType = profileController.actualPhase.phaseLessons[count].lessonType
                
                if count - 1 == lessonsNumber - 2 {
                    buttonText = "Jogar"
                    
                }
                
            }
            else {
                actualScreen = "exercise"
                count = 0
                progressValue = progressValue + (1.0 / Float(lessonsNumber + exercisesNumber))
            }
        }
        else if (actualScreen == "exercise") {
            // Se tiver exercício para fazer
            buttonText = "Próximo"
            
            if count != exercisesNumber - 1 {
                count = count + 1
                progressValue = progressValue + (1.0 / Float(lessonsNumber + exercisesNumber))
                exerciseType = profileController.actualPhase.phaseExercises[count].exerciseType
            }
            else {
                // Finalizar Fase
                primaryController.onPhase = false
                buttonText = ""
            }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                if (actualScreen == "lesson") {
                    
                    if lessonType == "soundClass" {
                        SoundLessonView(lesson: profileController.actualPhase.phaseLessons[count], changeScreen: changeScreen, buttonText: $buttonText)
                    }
                }
                else if(actualScreen == "exercise") {
                    HStack {
                        Text("Exercício")
                    }
                }
                else {
                    HStack {
                        Text("Parabens!!!")
                        Button (action: {
                            profileController.phasesDone.append(profileController.actualPhase.phaseId)
                            primaryController.onPhase = false
                        }) {
                            Text("Concluir fase")
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 195/255, green: 234/255, blue: 1))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {primaryController.onPhase = false}) {
                        Image(systemName: "x.square.fill")
                            .font(.system(size: 24))
                    }
                }

                ToolbarItemGroup(placement: .principal) {
                   
                    ProgressBar(value: $progressValue, maxValue: 1.0)
                        .frame(width: 200, height: 20)
                    
                }
            }

        }

        .onAppear {
            lessonType = profileController.actualPhase.phaseLessons[0].lessonType
            lessonsNumber = profileController.actualPhase.phaseLessons.count
            exercisesNumber = profileController.actualPhase.phaseExercises.count
        }
        
    }
}