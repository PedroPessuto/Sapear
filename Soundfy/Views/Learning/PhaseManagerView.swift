//
//  LessonManagerView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import SwiftUI

struct PhaseManagerView: View {
    
    @EnvironmentObject var profileController: ProfileController
    
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
                lessonType = profileController.actualPhase!.phaseLessons[count].lessonType
                
                if count - 1 == lessonsNumber - 2 {
                    buttonText = "Jogar"
                }
                
            }
            // Se NÃO tiver aula para fazer
            else {
                if exercisesNumber == 0 {
                    actualScreen = "finished"
                    
                }
                else {
                    actualScreen = "exercise"
                    buttonText = "Próximo"
                    
                    exerciseType = profileController.actualPhase!.phaseExercises[0].exerciseType
                    
                }
                
                count = 0
                progressValue = progressValue + (1.0 / Float(lessonsNumber + exercisesNumber))
                
            }
        }
        // Se tiver em exercício
        else if actualScreen == "exercise" {
            
            // Se tiver exercício para fazer
            if count != exercisesNumber - 1 {
                count = count + 1
                progressValue = progressValue + (1.0 / Float(lessonsNumber + exercisesNumber))
                exerciseType = profileController.actualPhase!.phaseExercises[count].exerciseType
                
            }
            else {
                // Finalizar Fase
                actualScreen = "finished"
                buttonText = "Concluir"
                progressValue = progressValue + (1.0 / Float(lessonsNumber + exercisesNumber))
            
            }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                if (actualScreen == "lesson") {
                    
                    if lessonType == "soundClass" {
                        LessonView(lesson: profileController.actualPhase!.phaseLessons[count], changeScreen: changeScreen, count: count, buttonText: $buttonText)
                    }
                    else if lessonType == "phonemeClass" {
//                        PhonemeLessonView(lesson: profileController.actualPhase!.phaseLessons[count], changeScreen: changeScreen, count: count, buttonText: $buttonText)
                        LessonView(lesson: profileController.actualPhase!.phaseLessons[count], changeScreen: changeScreen, count: count, buttonText: $buttonText)
                    }
                    else if lessonType == "wordClass" {
                        LessonView(lesson: profileController.actualPhase!.phaseLessons[count], changeScreen: changeScreen, count: count, buttonText: $buttonText)
                    }
                }
                else if(actualScreen == "exercise") {
                    
                    if exerciseType == "soundExercise" {
                        ExerciseView(exercise: profileController.actualPhase!.phaseExercises[count], count: count, changeScreen: changeScreen)
                    }
                    else if exerciseType == "phonemeExercise" {
                        ExerciseView(exercise: profileController.actualPhase!.phaseExercises[count], count: count, changeScreen: changeScreen)
                    }
                    else if exerciseType == "wordExercise" {
                        ExerciseView(exercise: profileController.actualPhase!.phaseExercises[count], count: count, changeScreen: changeScreen)
                    }
                }
                else {
                    HStack {
                        FineshedView(changeScreen: changeScreen)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 195/255, green: 234/255, blue: 1))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {profileController.onPhase = false}) {
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
            lessonType = profileController.actualPhase!.phaseLessons[0].lessonType
            lessonsNumber = profileController.actualPhase!.phaseLessons.count
            exercisesNumber = profileController.actualPhase!.phaseExercises.count
        }
        
    }
}
