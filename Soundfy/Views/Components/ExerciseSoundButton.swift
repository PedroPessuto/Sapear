//
//  SoundAlternativeButton.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 02/10/23.
//

import SwiftUI

struct ExerciseSoundButton: View {
    var item: Alternative
    var exerciseAnswer: Int
    var number: Int
    
    @State var isWrong: Bool = false
    @State var isRight: Bool = false
    @Binding var selectedOption: Int
    @Binding var selectedOptionId: UUID
    @Binding var clickedAlternatives: [UUID]
    
    @State var buttonPrimaryColor: Color = Color(red: 238/255, green: 128/255, blue: 81/255)
    @State var buttonSecondaryColor: Color = Color(red: 229/255, green: 94/255, blue: 41/255)
    @State var buttonPading: CGFloat = 8
    
    var body: some View {
        
        VStack {
        if isWrong {
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 83/255, green: 83/255, blue: 83/255))
                        .frame(width: 140, height: 100)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemGray))
                            .frame(width: 140, height: 100)
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 83/255, green: 83/255, blue: 83/255), lineWidth: 3)
                            )
                        
                        
                        VStack {
                            Image(systemName: item.alternativeImage)
                                .font(.title)
                            Text(item.alternativeLabel)
                        }
                        .foregroundColor(.secondary)
                    }
                    .padding(.trailing, buttonPading)
                    .padding(.bottom, buttonPading)
                    
                    ZStack{
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .fontWeight(.black)
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.red)
                            .bold()
                    }.offset(x: 60, y: -55)
                    
                    
                }
            }
        }
        else if isRight {
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 34/255, green: 169/255, blue: 1/255))
                        .frame(width: 140, height: 100)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 159/255, green: 252/255, blue: 191/255))
                            .frame(width: 140, height: 100)
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 34/255, green: 169/255, blue: 1/255), lineWidth: 3)
                            )
                        
                        
                        VStack {
                            Image(systemName: item.alternativeImage)
                                .font(.title)
                            Text(item.alternativeLabel)
                        }
                        .foregroundColor(.green)
                    }
                    .padding(.trailing, buttonPading)
                    .padding(.bottom, buttonPading)
                    
                    ZStack{
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .fontWeight(.black)
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.green)
                            .bold()
                    }.offset(x: 60, y: -55)
                    
                    
                }
            }
        }
            else {
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
            }
        }
        .onTapGesture {
            selectedOption = number
            selectedOptionId = item.alternativeId
        }
        .onChange(of: clickedAlternatives, perform: { newValue in
            if clickedAlternatives.contains(item.alternativeId) {
                if exerciseAnswer == number {
                    isRight = true
                }
                else {
                    isWrong = true
                }
            }
            
            else {
                isWrong = false
                isRight = false
            }
        
        })
        .onChange(of: selectedOption) { newValue in
            if selectedOption == number {
                buttonPrimaryColor = Color(red: 242/255, green: 165/255, blue: 132/255)
                buttonPading = 0
            }
            else {
                buttonPrimaryColor = Color(red: 238/255, green: 128/255, blue: 81/255)
                buttonPading = 8
            }
        }
       
    }
}
