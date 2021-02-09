//
//  AuthService.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 07/02/2021.
//

import Foundation
import Combine
import FirebaseAuth

protocol AuthServiceProtocol {
    var currentuser: User? { get }
    func signInWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, StudyCardsError>
    func signUpWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, StudyCardsError>
    func logout() -> AnyPublisher<Void, StudyCardsError>
}

final class AuthService: AuthServiceProtocol {
    
    let currentuser = Auth.auth().currentUser

    func signUpWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, StudyCardsError> {
        return Future<Void, StudyCardsError> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    return promise(.failure(.authError(description: error.localizedDescription)))
                } else {
                    return promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
 
    func signInWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, StudyCardsError> {
        return Future<Void, StudyCardsError> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    return promise(.failure(.authError(description: error.localizedDescription)))
                } else {
                    return promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func logout() -> AnyPublisher<Void, StudyCardsError> {
        return Future<Void, StudyCardsError> { promise in
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                return promise(.failure(.authError(description: signOutError.localizedDescription)))
            }
            return promise(.success(()))
        }.eraseToAnyPublisher()
    }
}
