//
//  SoundsView.swift
//  Soundfy
//
//  Created by Rafael Carreira on 25/09/23.
//

import SwiftUI

struct TrailView: View {
    
    @EnvironmentObject var contentController: ContentController
    
    @EnvironmentObject var profileController: ProfileController
    @Binding var screenName: String
    
    var body: some View {
        ScrollView {
            if screenName == "Sons" {
                ForEach(contentController.soundsSections.indices, id: \.self) {
                    index in
                    SectionView(section: $contentController.soundsSections[index])
                }
            }
            else if screenName == "Fonemas" {
                
            }
            else if screenName == "Palavras" {
                
            }
        }
        .fullScreenCover(isPresented: $profileController.onPhase) {
            PhaseManagerView()
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 195/255, green: 234/255, blue: 1))
//        .background(Image("BackgroundLake").resizable())
    }
}


