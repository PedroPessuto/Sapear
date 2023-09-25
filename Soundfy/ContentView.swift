//
//  ContentView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            SoundsView()
                .tabItem {
                    Image(systemName: "speaker.wave.2.fill")
                    Text("sons-string")
                }
            
            PhonemesView()
                .tabItem {
                    Image(systemName: "a.square")
                    Text("fonemas-string")
                }
            
            WordView()
                .tabItem {
                    Image(systemName: "textformat.abc")
                    Text("palavra-string")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("perfil-string")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
