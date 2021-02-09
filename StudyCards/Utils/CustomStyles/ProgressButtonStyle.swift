//
//  ProgressButtonStyle.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 08/02/2021.
//

import SwiftUI

public struct ProgressButtonStyle {

    public init(width: CGFloat? = nil,
                height: CGFloat? = nil,
                cornerRadious: CGFloat? = nil,
                backgroundColor: Color? = nil) {
        self.width = width ?? 312
        self.height = height ?? 54
        self.cornerRadious = cornerRadious ?? 0
        self.backGroundColor = backgroundColor ?? Color.black
    }
    
    public var width: CGFloat
    public var height: CGFloat
    public var cornerRadious: CGFloat
    public var backGroundColor: Color
    
}
