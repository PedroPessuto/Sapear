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
        ZStack {
            VStack {
                VStack {
                    Text(section.sectionName)
                        .font(.title2)
                        .bold()
                    Text(section.sectionDescription)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(section.sectionColor)
                
                .padding(.bottom, 50)
                
                
                ForEach (section.sectionPhases.indices, id: \.self) {
                    index in
                    HStack {
                        if (index % 2 == 0) {
                            PhaseView(phase: section.sectionPhases[index])
                                .padding(.trailing, 175)
                            
                        } else {
                            PhaseView(phase: section.sectionPhases[index])
                                .padding(.leading, 175)
                        }
                    }
                }
            }
            .padding(.bottom, 50)
            
        }
        //        .navigationTitle(section.sectionName)
    }
}
