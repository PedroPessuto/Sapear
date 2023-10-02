//
//  AlternativeButton.swift
//  Soundfy
//
//  Created by Rafael Carreira on 28/09/23.
//

import SwiftUI

struct AlternativeButton: View {
    var item: Alternative
    
    @State var buttonPrimaryColor: Color = Color(red: 238/255, green: 128/255, blue: 81/255)
    @State var buttonSecondaryColor: Color = Color(red: 229/255, green: 94/255, blue: 41/255)
    @State var buttonPading: CGFloat = 8
    
    var body: some View {
        
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(buttonSecondaryColor)
                    .frame(width: 140, height: 100)
                    
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(buttonPrimaryColor)
                        .frame(width: 140, height: 100)
                        
                    
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
        }
        
        
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            if pressing {
                buttonPrimaryColor = Color(red: 242/255, green: 165/255, blue: 132/255)
                buttonPading = 0
            } else {
                buttonPrimaryColor = Color(red: 238/255, green: 128/255, blue: 81/255)
                buttonPading = 8
                
            }
        }, perform: { })
    }
}

struct Alternative_Previews: PreviewProvider {
    static var previews: some View {
        AlternativeButton(item: Alternative(alternativeLabel: "Chuva", alternativeSoundName: "Chuva", alternativeImage: "cloud.rain.fill"))
    }
}
