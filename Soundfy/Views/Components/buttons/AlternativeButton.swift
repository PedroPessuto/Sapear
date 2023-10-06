//
//  AlternativeButton.swift
//  Soundfy
//
//  Created by Rafael Carreira on 28/09/23.
//

import SwiftUI

struct AlternativeButton: View {
    var item: Alternative
    var buttonAction: () -> Void
    @State var buttonPrimaryColor: Color = Color(red: 238/255, green: 128/255, blue: 81/255)
    @State var buttonSecondaryColor: Color = Color(red: 229/255, green: 94/255, blue: 41/255)
    @State var buttonPading: CGFloat = 8
    
    func getSafeImage(named: String) -> Bool {
        let uiImage =  (UIImage(named: named) ?? UIImage(named: "Default.png"))!
        if uiImage == UIImage(named: "Default.png"){
            return false
        }
        return true
    }
    
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
                        if getSafeImage(named: item.alternativeImage){
                            Image(item.alternativeImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }else{
                            Image(systemName: item.alternativeImage).font(.title)
                        }
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
                buttonAction()
                
            }
        }, perform: { })
    }
}
