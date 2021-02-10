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
                    VStack {
                        
                        Text("Memorizer app")
                            .font(.headline)
                            .padding(.leading, 20)
                            .padding(.top, 40)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text("Learn by")
                            .font(.title)
                            .padding(.leading, 20)
                            .padding(.top, 5)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        HStack {
                            Text("Having")
                            Text("Fun").bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.leading, 20)
                        .font(.title)
                        
                        Spacer()
                        
                    }.frame(width: geometry.size.width, height: 200)
                    .background(OneSideRoundedRectangle(radius: 25.0).fill(Color.mainColor).overlay(
                                    
                                    HStack {
                                        Image("logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 150, alignment: .bottom)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing))
                    )
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
                            
                        })
                        .disabled(true)
                        .frame(width: geometry.size.width - 40, height: 55)
                        .background(Color.mainColor)
                        .cornerRadius(15)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Text("Another login options")
                        .font(.footnote)
                        .foregroundColor(Color(.systemGray))
                        .padding(.top, 10)
                    
                    HStack(spacing: 40) {
                        Button(action: {}, label: {
                            
                            Image(systemName: "applelogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(5)
                            
                        })
                        .frame(width: (geometry.size.width - 40)/3)
                        .background(Color.mainColor)
                        .cornerRadius(15)
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "applelogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(5)
                            
                        })
                        .frame(width: (geometry.size.width - 40)/3)
                        .background(Color.mainColor)
                        .cornerRadius(15)
                        
                    }.padding(.top, 5)
                    
                    Spacer()
                    
                    VStack {
                        Text("Don't have an account?")
                            .foregroundColor(Color(.systemGray))
                            .bold()
                        
                        Button(action: {}, label: {
                            Text("Sign Up")
                                .bold()
                                .padding(.top, 2)
                                .foregroundColor(Color.mainColor)
                                .padding(.bottom, 50)
                        })
                    }.padding(.top, 30)
                    
                }
            }
            .ignoresSafeArea(edges: .all)
        }
    }
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                LoginView().previewDevice("iPhone 12")
//                                LoginView().previewDevice("iPhone 8")
            }
        }
    }
}
