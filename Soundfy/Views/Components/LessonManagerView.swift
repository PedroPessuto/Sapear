//
//  LessonManagerView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import SwiftUI

struct LessonManagerView: View {
    
    @EnvironmentObject var profileController: ProfileController
    @EnvironmentObject var primaryController: PrimaryController
    @EnvironmentObject var contentController: ContentController
    
    @State var countIndex: Int = 0
    
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    
    var body: some View {
        NavigationStack{
            
            VStack {
                
                Button (action: {
                    primaryController.onPhase = false
                }) {
                    Text(profileController.actualPhase.phaseName)
                }
                VStack{
                    Text(profileController.actualPhase.phaseName)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(profileController.actualPhase.phaseLessons[0].lessonDescription)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                }
                LazyVGrid(columns: columns, spacing: 20) {
                    if let soundLesson = profileController.actualPhase.phaseLessons[0] as? SoundLesson {
                        ForEach(soundLesson.lessonAlternatives, id: \.alternativeId) { item in
                            // seu código aqui
                        }
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}
