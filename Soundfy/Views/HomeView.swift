//
//  BaseView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 27/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var screenName: String = "Sons"
    @State var screens = ["Sons",  "Fonemas", "Palavras"]

    @EnvironmentObject var profileController: ProfileController
    @EnvironmentObject var contentController: ContentController
    @FetchRequest(entity: PhaseCoreData.entity(), sortDescriptors: []) var phasesDone: FetchedResults<PhaseCoreData>
    @Environment(\.managedObjectContext) var contexto
    @EnvironmentObject var progressionController: ProgressionController
    
    var body: some View {
        NavigationStack {
           
            VStack (spacing: 0) {
                
                // ===== HEADER =====
                VStack {
                    Picker("Sections", selection: $screenName) {
                        ForEach(screens, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.top, 5)
                .padding(.horizontal)
                .padding(.bottom)
                .background(Color(red: 195/255, green: 234/255, blue: 1))
                
                // ===== BODY =====
                TrailView(screenName: $screenName)
                    .ignoresSafeArea()
            }
//            .navigationTitle(screenName)
            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(Color(primaryController.primaryColor), for: .navigationBar)
//            .toolbarBackground(.hidden, for: .navigationBar) // Linha do Background
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Image(systemName: "chart.bar.xaxis")
                        .foregroundColor(Color(red: 123/255, green: 167/255, blue: 215/255))
                        .font(.system(size: 25))
                }
            }
        }
        .onAppear {
            let uuids: [UUID] = phasesDone.compactMap { $0.id }
            profileController.phasesDone = uuids
            
            outerLoop: for section in contentController.soundsSections {
                for phase in section.sectionPhases {
                    if phase.phaseId == profileController.actualPhaseId {
                        profileController.actualPhase = phase
                        break outerLoop
                    }
                }
            }

        }
    }
}
