//
//  CustomTextField.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 07/02/2021.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color.gray)
                    .padding(.leading, 40)
            }
            
            HStack (spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemGray))
                
                TextField("", text: $text).autocapitalization(.none)
            }
        }
        .padding()
    }
}


