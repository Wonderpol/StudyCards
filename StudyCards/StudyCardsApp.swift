//
//  StudyCardsApp.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 07/02/2021.
//

import SwiftUI

@main
struct StudyCardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
