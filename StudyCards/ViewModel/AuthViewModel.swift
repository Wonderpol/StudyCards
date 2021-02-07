//
//  AuthViewModel.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 07/02/2021.
//

import Foundation
import Combine
import Firebase

final class AuthViewModel: ObservableObject {
    
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var isFormValid = false
    @Published var userSession: User?
    
    private var cancellables: [AnyCancellable] = []
    private let authService: AuthServiceProtocol
    private let mode: Mode
    
    init(authService: AuthServiceProtocol = AuthService(), mode: Mode) {
        self.authService = authService
        self.mode = mode
        getCurrentUser()
    }
    
    private func getCurrentUser() {
        authService.currentUser().sink { user in
            self.userSession = user
        }.store(in: &cancellables)
    }
    
}

extension AuthViewModel {
    enum Mode {
        case login
        case createUser
    }
}
