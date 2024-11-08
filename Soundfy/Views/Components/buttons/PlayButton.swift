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
    @Binding var isDisabled: Bool
    
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
        .disabled(isDisabled)
        .frame(height: 60)
        .onChange(of: isDisabled, perform: { newValue in
            if isDisabled{
                buttonPrimaryColor = Color(UIColor.systemGray)
                buttonSecondaryColor = Color.gray
            }else{
                buttonPrimaryColor = Color(UIColor.systemGreen)
                buttonSecondaryColor = Color(red: 36/255, green: 135/255, blue: 12/255)
            }
        })
        .onAppear{
            if isDisabled{
                buttonPrimaryColor = Color(UIColor.systemGray)
                buttonSecondaryColor = Color.gray
            }else{
                buttonPrimaryColor = Color(UIColor.systemGreen)
                buttonSecondaryColor = Color(red: 36/255, green: 135/255, blue: 12/255)
            }
        }
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            if !isDisabled {
                if pressing {
                    buttonPrimaryColor = Color(UIColor.systemGreen)
                    buttonPading = 0
                } else {
                    buttonPrimaryColor = Color(UIColor.systemGreen)
                    buttonPading = 10
                    buttonAction()
                }
            }
        }, perform: { })
    }
}

