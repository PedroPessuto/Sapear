//
//  PrimaryController.swift
//  Soundfy
//
//  Created by Rafael Carreira on 25/09/23.
//

import Foundation
import SwiftUI

class PrimaryController: ObservableObject {
    
    @Published var primaryColor: UIColor
    @Published var secondaryColor: UIColor
    @Published var onPhase: Bool

    init(onPhase: Bool = false, primaryColor: UIColor = .orange, secondaryColor: UIColor = .white) {
        self.onPhase = onPhase
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
}

