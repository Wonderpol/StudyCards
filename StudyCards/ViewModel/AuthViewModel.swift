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
    
    @Published var error: StudyCardsError?
    @Published var isInProgress = false
    
    private var cancellables: [AnyCancellable] = []
    private let authService: AuthServiceProtocol
    
    static let shared = AuthViewModel()
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        self.userSession = authService.currentuser
    }
    
    func auth(email: String, password: String, mode: Mode) {
        switch mode {
        case .login:
            self.isInProgress = true
            authService.signInWithEmailAndPassword(email: email, password: password).sink { completion in
                self.isInProgress = false
                switch completion {
                case let .failure(error):
                    self.error = error
                case .finished:
                    print("DEBUG: Succesfully logged in")
                    break
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
            
        case .createUser:
            self.isInProgress = true
            authService.signUpWithEmailAndPassword(email: email, password: password).sink { completion in
                self.isInProgress = false
                switch completion {
                case let .failure(error):
                    self.error = error
                case .finished:
                    print("DEBUG: Succesfully registered new user")
                    break
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
        }
    }
    
    func singOut() {
        self.isInProgress = true
        authService.logout().sink { completion in
            self.isInProgress = false
            switch completion {
            case .finished:
                print("DEBUG: SingOut with success")
                break
            case let .failure(error):
                self.error = error
            }
        } receiveValue: { _ in }
        .store(in: &cancellables)
    }
    
}

extension AuthViewModel {
    enum Mode {
        case login
        case createUser
    }
}
