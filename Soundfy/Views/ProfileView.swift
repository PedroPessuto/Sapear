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
                    ProgressBar(value: $soundsValue, maxValue: 1.0)
                        .frame(width: 200, height: 20)
                }
                
                
            }
            .onAppear {
                soundsValue = Float(profileController.soundsExercisesRight / profileController.soundsExercisesDone)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
