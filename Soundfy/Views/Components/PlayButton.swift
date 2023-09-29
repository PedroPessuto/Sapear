//
//  PlayButton.swift
//  Soundfy
//
//  Created by Rafael Carreira on 28/09/23.
//

import SwiftUI

struct PlayButton: View {
    var buttonAction: () -> Void
    var buttonText: String
        
    @State var buttonPrimaryColor: Color = Color(UIColor.systemGreen)
    @State var buttonSecondaryColor: Color = Color(red: 36/255, green: 135/255, blue: 12/255)
    @State var buttonPading: CGFloat = 5
    
    var body: some View {
        
        VStack {
            ZStack {
                buttonPrimaryColor
                    .cornerRadius(10)
                
                VStack {
                    Text(buttonText)
                        .bold()
                }
                .foregroundColor(.white)
            }
            .padding(.trailing, buttonPading)
            .padding(.bottom, buttonPading)
        }
        .background(buttonSecondaryColor)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .cornerRadius(10)
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            if pressing {
                buttonPrimaryColor = Color(UIColor.systemGreen)
                buttonPading = 0
            } else {
                buttonPrimaryColor = Color(UIColor.systemGreen)
                buttonPading = 5
                buttonAction()
            }
        }, perform: { })
    }
}


