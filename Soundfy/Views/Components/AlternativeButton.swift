//
//  AlternativeButton.swift
//  Soundfy
//
//  Created by Rafael Carreira on 28/09/23.
//

import SwiftUI

struct AlternativeButton: View {
    var item: Alternative
    
    @State var buttonPrimaryColor: Color = Color(UIColor.systemOrange)
    @State var buttonSecondaryColor: Color = Color(red: 229/255, green: 94/255, blue: 41/255)
    @State var buttonPading: CGFloat = 5
    
    var body: some View {
        
        VStack {
            ZStack {
                buttonPrimaryColor
                    .cornerRadius(10)
                
                VStack {
                    Image(systemName: item.alternativeImage)
                        .font(.title)
                    Text(item.alternativeLabel)
                }
                .foregroundColor(.white)
            }
            .padding(.trailing, buttonPading)
            .padding(.bottom, buttonPading)
        }
        .background(buttonSecondaryColor)
        .frame(width: 140, height: 100)
        .cornerRadius(10)
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            if pressing {
                buttonPrimaryColor = Color(UIColor.systemOrange)
                buttonPading = 0
            } else {
                buttonPrimaryColor = Color(UIColor.systemOrange)
                buttonPading = 5
                
            }
        }, perform: { })
    }
}

