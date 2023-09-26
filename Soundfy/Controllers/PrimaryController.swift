//
//  PrimaryController.swift
//  Soundfy
//
//  Created by Rafael Carreira on 25/09/23.
//

import Foundation
import SwiftUI

class PrimaryController: ObservableObject {
    var primaryColor: UIColor

    init(primaryColor: UIColor = .green) {
        self.primaryColor = primaryColor
    }
}

