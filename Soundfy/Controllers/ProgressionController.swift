//
//  ProgressionController.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 03/10/23.
//

import Foundation
import CoreData

class ProgressionController: ObservableObject {
    let container = NSPersistentContainer(name: "ProgressionModel")
    
    init() {
        container.loadPersistentStores {
            desc, error in
            if error != nil {
                print("Erro ao carregar os dados")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        }
        catch {
            print("Erro ao salvar os dados")
        }
    }
    
    func addPhaseDone(id: UUID, context: NSManagedObjectContext) {
        let phase = PhaseCoreData(context: context)
        phase.id = id
        save(context: context)
    }
}
