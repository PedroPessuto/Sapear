//
//  SoundButton.swift
//  Soundfy
//
//  Created by Rafael Carreira on 29/09/23.
//

import SwiftUI

struct SoundButton: View {
    
    var buttonAction: () -> Void
    @State var buttonPading: CGFloat = 10
    @State var buttonPrimaryColor: Color = Color(red: 56/255, green: 128/255, blue: 147/255)
    @State var buttonSecondaryColor: Color = Color(red: 34/255, green: 100/255, blue: 117/255)
    var body: some View {
        
        VStack{
            ZStack{
                
                Circle()
                    .fill(buttonPrimaryColor)
                    .frame(width: 150)
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size:50))
                    .foregroundColor(.white)
            }
            .padding(.bottom, buttonPading)
        }
        .background(buttonSecondaryColor)
        .cornerRadius(100)
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            if pressing {
                buttonPrimaryColor = Color(red: 109/255, green: 172/255, blue: 189/255)
                buttonPading = 5
            } else {
                buttonPrimaryColor = Color(red: 56/255, green: 128/255, blue: 147/255)
                buttonPading = 10
                buttonAction()
            }
        }, perform: { })
        
        
    }
}

