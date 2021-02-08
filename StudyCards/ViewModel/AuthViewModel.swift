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
    
    private static let shared = AuthViewModel()
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        self.userSession = authService.currentuser
    }
    
    func auth(email: String, password: String, mode: Mode) {
        switch mode {
        case .login:
            authService.signInWithEmailAndPassword(email: email, password: password).sink { completion in
                switch completion {
                case let .failure(error):
                    print("DEBUG: \(error.localizedDescription)")
                case .finished:
                    print("DEBUG: Succesfully logged in")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
            
        case .createUser:
            authService.signUpWithEmailAndPassword(email: email, password: password).sink { completion in
                switch completion {
                case let .failure(error):
                    print("DEBUG: \(error.localizedDescription)")
                case .finished:
                    print("DEBUG: Succesfully registered new user")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
        }
    }
    
}

extension AuthViewModel {
    enum Mode {
        case login
        case createUser
    }
}
