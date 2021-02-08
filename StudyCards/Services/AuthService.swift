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
    func signInWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error>
    func signUpWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error>
    func logout() -> AnyPublisher<Void, Error>
}

final class AuthService: AuthServiceProtocol {
    
    let currentuser = Auth.auth().currentUser

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
    
    func logout() -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                return promise(.failure(signOutError))
            }
            return promise(.success(()))
        }.eraseToAnyPublisher()
    }
}
