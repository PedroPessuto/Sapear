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

    init(primaryColor: UIColor = .orange, secondaryColor: UIColor = .white) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
}

