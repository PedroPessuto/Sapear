//
//  SoundsView.swift
//  Soundfy
//
//  Created by Rafael Carreira on 25/09/23.
//

import SwiftUI

struct SoundsView: View {
    
    @EnvironmentObject var generalObject: PrimaryController
    @EnvironmentObject var contentController: ContentController
    
    var body: some View {
        ScrollView {
            ForEach(contentController.soundsSections.indices, id: \.self) {
                index in
                SectionView(section: $contentController.soundsSections[index])
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 195/255, green: 234/255, blue: 1))
//        .background(Image("BackgroundLake").resizable())

        
        
    }
}


