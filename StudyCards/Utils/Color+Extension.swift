//
//  Color+Extension.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 07/02/2021.
//

import SwiftUI

extension Color {
    
    static func hexStringToColor (hex:String, opacity: Double = 1.0) -> Color {
          var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
          if (cString.hasPrefix("#")) {
              cString.remove(at: cString.startIndex)
          }
          if ((cString.count) != 6) {
              return Color.gray
          }
          var rgbValue:UInt64 = 0
          Scanner(string: cString).scanHexInt64(&rgbValue)
          return Color(
              red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: Double(rgbValue & 0x0000FF) / 255.0,
              opacity: Double(opacity)
          )
      }
    
    static let mainColor = Color("mainAppColor")
    static let customTextInputColor = Color("CustomInputTextColor")
}
