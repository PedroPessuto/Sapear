//
//  PlayButton.swift
//  Soundfy
//
//  Created by Rafael Carreira on 28/09/23.
//

import SwiftUI

struct PlayButton: View {
    var actionButton: ()->Void
    var textButton: String
    
    var body: some View {
        Button(action: {
            actionButton()
        }) {
            HStack{
                
                Text(textButton)
                    .foregroundColor(.white)
                    
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color(.purple))
        }
        .cornerRadius(10)
        .shadow(color: .red, radius: 0, x: 5, y: 5)
    }
}


