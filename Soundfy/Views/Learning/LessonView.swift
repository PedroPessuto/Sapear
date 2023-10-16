//
//  LessonView.swift
//  Soundfy
//
//  Created by Rafael Carreira on 03/10/23.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!
struct LessonView: View {
    
    @EnvironmentObject var profileController: ProfileController
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var lesson: Lesson
    var changeScreen: () -> Void
    var count: Int
    @Binding var buttonText: String
    
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
    
    @State var palavraescrita: String = "B"
    @State var isTalking: Bool = false
    
    var body: some View {
        VStack {
            
            // ===== BODY =====
            
            VStack (spacing: 10) {
                
                
                Text(lesson.lessonName)
                    .font(Font.custom("Quicksand-Bold", size: 40, relativeTo: .largeTitle))
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(lesson.lessonDescription)
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                if (lesson.lessonType != "soundClass") {
                    VStack {
                        FrogTalking(playSound: playSound, getSound: {return ""}, palavraescrita: $palavraescrita, isDisabled: true, isTalking: $isTalking, type: lesson.lessonType)
                    }
                    
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach (lesson.lessonAlternatives, id: \.alternativeId) {
                            alternative in
                            AlternativeButton(item: alternative, buttonAction: {
                                if alternative.alternativeSoundName != nil {
                                    playSound(Nome: alternative.alternativeSoundName ?? "")
                                }
                                
                                palavraescrita = alternative.alternativeSoundName!
                                isTalking.toggle()
                            })
                        }
                    }
                   
                }
                else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach (lesson.lessonAlternatives, id: \.alternativeId) {
                            alternative in
                            AlternativeButton(item: alternative, buttonAction: {
                                if alternative.alternativeSoundName != nil {
                                    playSound(Nome: alternative.alternativeSoundName ?? "")
                                }
                            })
                        }
                    }
                }
                
                
                
            }
            
            // ===== FOOTER =====
                    
            Spacer()
            PlayButton(buttonAction: {changeScreen() 
                playSound(Nome: "vazio")}, buttonText: buttonText, isDisabled: .constant(false))
        }
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}
