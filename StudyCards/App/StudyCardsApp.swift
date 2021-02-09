//
//  StudyCardsApp.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 07/02/2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct StudyCardsApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(AuthViewModel.shared)
        }
    }
}
