//
//  LessonView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import SwiftUI

struct LessonView: View {
    
    @EnvironmentObject var profileController: ProfileController
    @EnvironmentObject var primaryController: PrimaryController
    
    var body: some View {
        VStack {
            Button (action: {
                primaryController.onPhase = false
            }) {
                Text("djen")
            }
            Text("\(profileController.actualPhase)")
        }
        
    }
}
