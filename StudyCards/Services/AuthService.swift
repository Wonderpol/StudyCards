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
    func currentUser() -> AnyPublisher<User?, Never>
    func signInWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error>
    func signUpWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error>
}

final class AuthService: AuthServiceProtocol {
    
    func currentUser() -> AnyPublisher<User?, Never> {
        return Just(Auth.auth().currentUser)
            .eraseToAnyPublisher()
        }
    
    func signUpWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    return promise(.failure(error))
                } else {
                    return promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
 
    func signInWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    return promise(.failure(error))
                } else {
                    return promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
    
}
