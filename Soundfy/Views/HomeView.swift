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
                .background(Color(red: 195/255, green: 234/255, blue: 1))
                
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
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Image(systemName: "chart.bar.fill").opacity(0.5)
                }
            }
        }
//        .preferredColorScheme(.dark)
        
    }
}
