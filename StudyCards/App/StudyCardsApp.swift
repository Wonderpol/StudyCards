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

    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
