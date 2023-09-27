//
//  BaseView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var primaryController: PrimaryController
    @State var screenName: String = "Sons"
    var screens = ["Sons",  "Fonemas", "Palavras"]
    
    var body: some View {
        NavigationStack {
            
            VStack (spacing: 0) {
                VStack {
                    Picker("Sections", selection: $screenName) {
                        ForEach(screens, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                   
                }
                .padding(.horizontal)
                .padding(.bottom)
                .background(Color(primaryController.primaryColor))
                
             // Divider()
                
                VStack {
                    if (screenName == "Sons") {
                        TrailView()
                    }
                }
                .ignoresSafeArea()
            }
            .navigationTitle(screenName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(primaryController.primaryColor), for: .navigationBar)
            .toolbarBackground(.hidden, for: .navigationBar) // Linha do Background
        }
        .preferredColorScheme(.dark)
        
    }
}
