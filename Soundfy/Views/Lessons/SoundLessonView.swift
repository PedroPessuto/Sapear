//
//  SoundLessonView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 28/09/23.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!
struct SoundLessonView: View {
    
    @EnvironmentObject var profileController: ProfileController
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
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
    
    var lesson: Lesson
    var changeScreen: () -> Void
    var count: Int
    @Binding var buttonText: String
    
    var body: some View {
        VStack {
            
            // ===== BODY =====
            Spacer()
            VStack (spacing: 20) {
                Text(lesson.lessonName)
                    .font(Font.custom("Quicksand-Bold", size: 40, relativeTo: .largeTitle))
                    .bold()
                
                Text(lesson.lessonDescription)
                    .font(.title2)
                    .fontWeight(.medium)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    if let soundLesson = profileController.actualPhase!.phaseLessons[count] as? SoundLesson {
                        ForEach(soundLesson.lessonAlternatives, id: \.alternativeId) { item in
                            AlternativeButton(item: item, buttonAction: { playSound(Nome: item.alternativeSoundName) })
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
