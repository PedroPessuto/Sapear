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
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                VStack {
                    Text("Acertos")
                        .bold()
                        .font(.largeTitle)
                    
                    Text("Som")
                    
                    ZStack {
                        
                        ProgressBar(value: $soundsValue, maxValue: 1.0)
                            
                        
                        HStack {
                            
                            Spacer()
                            Text("\((profileController.soundsExercisesRight / profileController.soundsExercisesDone)*100,specifier: "%.0f")%")
                                .font(.body)
                                .padding(.trailing, 20)
                            
                        }
                        
                    }
                    .frame(width: 200, height: 20)
                    
                    Text("Realizados: \(profileController.soundsExercisesDone, specifier: "%.0f")")
                    Text("Acertados: \(profileController.soundsExercisesRight, specifier: "%.0f")")
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                soundsValue = Float((profileController.soundsExercisesRight / profileController.soundsExercisesDone))
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button (action: {onProfile.toggle()}) {
                        Image(systemName: "house.fill")
                            .foregroundColor(Color(red: 123/255, green: 167/255, blue: 215/255))
                            .font(.system(size: 25))
                    }
                }
            }
            .background(Color(red: 195/255, green: 234/255, blue: 1))
        }
    }
}
