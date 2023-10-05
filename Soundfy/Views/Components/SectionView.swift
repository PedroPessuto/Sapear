//
//  SectionView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//


import SwiftUI

struct SectionView: View {
    
    @Binding var section: Section
    
    var body: some View {
        VStack {
            
            // ===== SECTION HEADER =====
            
//            VStack {
//                Text(section.sectionName)
//                    .font(.title2)
//                    .bold()
//                Text(section.sectionDescription)
//            }
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity)
//            .frame(height: 100)
//            .background(section.sectionColor)
//            .padding(.bottom, 50)
            
            VStack {
                Text(section.sectionName)
                    .font(Font.custom("Quicksand-Bold", size: 40))
            }
            .foregroundColor(Color(red: 82/255, green: 146/255, blue: 180/255))
            .frame(width: 330)
            .frame(height: 80)
            .background(Color(red: 185/255, green: 220/255, blue: 239/255))
            .cornerRadius(20)
            .padding(.bottom, 50)
            
            // ===== SECTION BODY =====
            
            ForEach (section.sectionPhases.indices, id: \.self) {
                index in
                HStack {
                    if (index % 2 == 0) {
                        PhaseButton(phase: section.sectionPhases[index])
                            .padding(.trailing, 175)
                    }
                    else {
                        PhaseButton(phase: section.sectionPhases[index])
                            .padding(.leading, 175)
                    }
                }
            }
        }
        .padding(.bottom, 50)        
    }
}
