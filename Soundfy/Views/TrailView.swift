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
        ScrollView (showsIndicators: false) {
            if screenName == "Sons" {
                ForEach(contentController.soundsSections.indices, id: \.self) {
                    index in
                    SectionView(section: $contentController.soundsSections[index])
                }
            }
            else if screenName == "Fonemas" {
                ForEach(contentController.phonemesSection.indices, id: \.self) {
                    index in
                    SectionView(section: $contentController.phonemesSection[index])
                }
            }
            else if screenName == "Palavras" {
                ForEach(contentController.wordsSection.indices, id: \.self) {
                    index in
                    SectionView(section: $contentController.wordsSection[index])
                }
            }
        }
        .fullScreenCover(isPresented: $profileController.onPhase) {
            PhaseManagerView()
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 195/255, green: 234/255, blue: 1))
    }
}


