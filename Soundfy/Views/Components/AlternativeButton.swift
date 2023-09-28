//
//  AlternativeButton.swift
//  Soundfy
//
//  Created by Rafael Carreira on 28/09/23.
//

import SwiftUI

struct AlternativeButton: View {
    var item: Alternative
    // func playsound
    var body: some View {
        Button(action: {
            
        }) {
            ZStack {
                Color(.orange)
                VStack {
                    Image(systemName: item.alternativeImage)
                        .font(.title)
                    Text(item.alternativeLabel)
                }
                .foregroundColor(.white)
            }
        }
        .frame(width: 140, height: 100)
        .cornerRadius(10)
        .shadow(color: .red, radius: 0, x: 5, y: 5)
        
    }
}

