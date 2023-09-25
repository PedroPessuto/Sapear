//
//  SoundsView.swift
//  Soundfy
//
//  Created by Rafael Carreira on 25/09/23.
//

import SwiftUI

struct SoundsView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Sounds")
                    Text("Sounds")
                    Text("Sounds")
                    Text("Sounds")
                    
                }
            }
            
            .navigationTitle("Sounds")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.green, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
                
        }
    }
}
