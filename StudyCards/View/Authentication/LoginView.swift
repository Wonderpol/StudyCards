//
//  LoginView.swift
//  StudyCards
//
//  Created by Jan Piaskowy on 07/02/2021.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Memorizer App")
                            .font(.headline)
                            .padding(.leading, 20)
                            .padding(.top, 40)
                        
                        VStack(alignment: .leading) {
                            Text("Learn and")
                            
                            HStack {
                                Text("Get")
                                Text("Rewards").bold()
                            }
                            
                        }.padding(.leading, 20)
                        .padding(.top, 10)
                        .font(.system(size: 25))
                        
                        Spacer()
                        
                        HStack {
                            
                            Spacer()
                            
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }.frame(width: geometry.size.width, height: (geometry.size.height)/1.9, alignment: .topLeading)
                    .background(OneSideRoundedRectangle(radius: 25.0).fill(Color.mainColor))
                    .foregroundColor(.white)
                    
                    VStack(spacing: 20) {
                        
                        CustomTextField(text: $email, placeholder: Text("Email adress"), imageName: "person.fill")
                            .background(Color.customTextInputColor)
                            .cornerRadius(15)
                        
                        CustomTextField(text: $password, placeholder: Text("Password"), imageName: "key.fill")
                            .background(Color.customTextInputColor)
                            .cornerRadius(15)
                        
                        Button(action: {}, label: {
                            
                            Text("Sign In")
                                .foregroundColor(.white)
                            
                        }).frame(width: geometry.size.width - 40, height: 55)
                        .background(Color.mainColor)
                        .cornerRadius(15)
                        
                    }.padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    Text("Don't have an account?")
                        .bold()
                    
                    Text("Sign Up")
                        .bold()
                        .padding(.top, 2)
                        .foregroundColor(Color.mainColor)
                        .padding(.bottom, 50)
                    
                }
            }
            .ignoresSafeArea(edges: .all)
        }
    }
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                LoginView().previewDevice("iPhone 12")
                LoginView().previewDevice("iPhone 8")
            }
        }
    }
}
