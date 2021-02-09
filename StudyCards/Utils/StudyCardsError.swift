//
//  StudyCardsError.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 09/02/2021.
//

import Foundation
import Firebase

enum StudyCardsError: LocalizedError {
    case authError(description: String)
    case `default`(description: String? = nil)
    
    var description: String? {
        switch self {
        case let .authError(description):
            return description
        case let .default(description):
            return description ?? "Undefined error"
        }
    }
    
}
