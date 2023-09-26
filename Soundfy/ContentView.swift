//
//  ContentView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var generalController = PrimaryController()
    @StateObject var contentController = ContentController()
    @StateObject var profileController = ProfileController()
    
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
                .background(Color(generalController.primaryColor))
                
             // Divider()
                
                VStack {
                    if (screenName == "Sons") {
                        SoundsView()
                    }
                }
                .ignoresSafeArea()
            }
            .navigationTitle(screenName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(generalController.primaryColor), for: .navigationBar)
            .toolbarBackground(.hidden, for: .navigationBar) // Linha do Background
        }
        .preferredColorScheme(.dark)
        .environmentObject(generalController)
        .environmentObject(contentController)
        .environmentObject(profileController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
