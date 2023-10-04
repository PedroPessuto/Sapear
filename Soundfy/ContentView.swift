//
//  ContentView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var primaryController = PrimaryController()
    @StateObject var contentController = ContentController()
    @StateObject var profileController = ProfileController()
    @StateObject var progressionController = ProgressionController()
    
    var body: some View {
        HomeView()
            .environmentObject(primaryController)
            .environmentObject(contentController)
            .environmentObject(profileController)
            .environmentObject(progressionController)
            .environment(\.managedObjectContext, progressionController.container.viewContext  )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
