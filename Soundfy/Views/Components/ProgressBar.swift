//
//  ProgressBar.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 29/09/23.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    var maxValue: Float
    @State private var animatedValue: Float = 0
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
            
                Rectangle()
                    .frame(width: max(0, min(CGFloat((self.animatedValue/self.maxValue)) * geometry.size.width, geometry.size.width)), height: geometry.size.height)

                    .foregroundColor(color)
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            animatedValue = value
                        }
                    }
                    .onChange(of: value) { newValue in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            animatedValue = newValue
                        }
                    }
                
                
            }
        
            
        }
       
        .cornerRadius(45.0)
    }
}
