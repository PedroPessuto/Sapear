//
//  ProfileView.swift
//  Soundfy
//
//  Created by Rafael Carreira on 25/09/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var onProfile: Bool
    @EnvironmentObject var profileController: ProfileController
    @State var soundsValue: Float = 0.0
    @State var wordsValue: Float = 0.0
    @State var phonemeValue: Float = 0.0
    @FetchRequest(sortDescriptors: []) var phasesDone: FetchedResults<PhaseCoreData>
    
    var body: some View {
        NavigationStack {
            VStack{
                
//                Button(action: {
//                    profileController.soundsExercisesDone = 0
//                    profileController.soundsExercisesRight = 0
//                    profileController.phonemeExercisesDone = 0
//                    profileController.phonemeExercisesRight = 0
//                    profileController.wordsExercisesDone = 0
//                    profileController.wordsExercisesRight = 0
//                }) {
//                    Text("Resetar")
//                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 300, height: 300)
                    Image("sapoEstatistica")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .offset(x:100, y:-139)
                    
                    VStack {
                        
                        VStack {
                            Text("Acertos")
                                .foregroundStyle(Color.green)
                                .font(.largeTitle)
                            HStack{
                                Text("Som")
                                    .foregroundStyle(Color.green)
                                Spacer()
                            }.frame(width: 200, height: 20)
                            ZStack {
                                ProgressBar(value: $soundsValue, maxValue: 1.0, color: .green)
                                HStack {
                                    Spacer()
                                    Text("\((profileController.soundsExercisesRight / profileController.soundsExercisesDone)*100,specifier: "%.0f")%")
                                        .font(.body)
                                        .padding(.trailing, 20)
                                }
                            }
                            .frame(width: 200, height: 20)
                            HStack{
                                Text("Letras")
                                    .foregroundStyle(Color.green)
                                Spacer()
                            }.frame(width: 200, height: 20)
                            ZStack {
                                ProgressBar(value: $phonemeValue, maxValue: 1.0, color: .green)
                                HStack {
                                    Spacer()
                                        
                                    Text("\( profileController.phonemeExercisesDone.isZero ? 0 :(profileController.phonemeExercisesRight / profileController.phonemeExercisesDone)*100,specifier: "%.0f")%")
                                        .font(.body)
                                        .padding(.trailing, 20)
                                }
                            }
                            .frame(width: 200, height: 20)
                            HStack{
                                Text("Palavras")
                                    .foregroundStyle(Color.green)
                                Spacer()
                            }.frame(width: 200, height: 20)
                            ZStack {
                                ProgressBar(value: $wordsValue, maxValue: 1.0, color: .green)
                                HStack {
                                    Spacer()
                                    Text("\( profileController.wordsExercisesDone.isZero ? 0 :(profileController.wordsExercisesRight / profileController.wordsExercisesDone)*100,specifier: "%.0f")%")
                                        .font(.body)
                                        .padding(.trailing, 20)
                                }
                            }
                            .frame(width: 200, height: 20)
                            
                            //                            Text("Realizados: \(profileController.soundsExercisesDone, specifier: "%.0f")")
                            //                            Text("Acertados: \(profileController.soundsExercisesRight, specifier: "%.0f")")
                        }
                    }
                    
                    .onAppear {
                        soundsValue = Float((profileController.soundsExercisesRight / profileController.soundsExercisesDone))
                        phonemeValue = Float((profileController.phonemeExercisesRight / profileController.phonemeExercisesDone))
                        wordsValue = Float((profileController.wordsExercisesRight / profileController.wordsExercisesDone))
                    }
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button (action: {onProfile.toggle()}) {
                                Image(systemName: "house.fill")
                                    .foregroundColor(Color(red: 229/255, green: 94/255, blue: 41/255))
                                    .font(.system(size: 25))
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Estatísticas")
                                .font(.largeTitle)
                                .foregroundColor(Color(red: 229/255, green: 94/255, blue: 41/255))
                                .bold()
                                .padding(.top, 80)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 255/255, green: 228/255, blue: 220/255))
        }
        
    }
}
