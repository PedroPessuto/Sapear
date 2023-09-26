//
//  ContentView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var generalController = PrimaryController()
    
    @State var screenName: String = "Sons"
    var screens = ["Sons",  "Fonemas", "Palavras"]
    
    
    var body: some View {
        NavigationStack {
            VStack {
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
                
                
                if (screenName == "Sons") {
                    SoundsView()
                }
                
                Spacer()
            }
            .navigationTitle(screenName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(generalController.primaryColor), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .environmentObject(generalController)
        .onAppear(){
            UITabBar.appearance().backgroundColor = generalController.primaryColor
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
