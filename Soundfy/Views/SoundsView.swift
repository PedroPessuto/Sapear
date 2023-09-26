//
//  SoundsView.swift
//  Soundfy
//
//  Created by Rafael Carreira on 25/09/23.
//

import SwiftUI

struct SoundsView: View {
    
    @EnvironmentObject var generalObject: PrimaryController
    
    var body: some View {
        NavigationStack{
            //Picker aqui 🙈
            ScrollView{
                
            }
        }
        
        .navigationTitle("Sounds")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color(generalObject.primaryColor), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
}

