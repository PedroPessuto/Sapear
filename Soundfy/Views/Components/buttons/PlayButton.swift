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
    @State var buttonPading: CGFloat = 10
    
    var body: some View {
        
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(buttonSecondaryColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(buttonPrimaryColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                    
                    VStack {
                        Text(buttonText)
                            .bold()
                    }
                    .foregroundColor(.white)
                }
//                .padding(.trailing, buttonPading)
                .padding(.bottom, buttonPading)
            }
        }
        .frame(height: 60)
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            if pressing {
                buttonPrimaryColor = Color(UIColor.systemGreen)
                buttonPading = 0
            } else {
                buttonPrimaryColor = Color(UIColor.systemGreen)
                buttonPading = 10
                buttonAction()
            }
        }, perform: { })
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(buttonAction: {},buttonText: "Próximo")
    }
}



