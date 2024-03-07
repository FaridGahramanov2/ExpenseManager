//
//  SignInPage.swift
//  ExpenseManager
//
//  Created by Farid Gahramanov on 17.09.23.
//

import SwiftUI

struct SignInPage: View {
    var body: some View {
        VStack{
            ZStack {
                Color("green")
                    .edgesIgnoringSafeArea(.all)
                
                Circle()
                    .padding(.top, -600)
                    .padding(.leading, -50)
                    .foregroundColor(Color("blue"))
                
                VStack {
                    Text("SpendWise")
                        .font(.custom("Sukhumvit Set Thin", size: 50))
                        .foregroundColor(.white)
                        .fontDesign(.serif)
                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                        .padding(.bottom, 100)
                    
                    Box("Password", isSecureField: true)
                    
                }
            }
        }
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}
struct Box: View {
    @State private var showAlert = false
    @State private var selectedOption: Int = 0
    @State private var emailSignIn: String = ""
    @State private var emailSignUp: String = ""
    @State private var passwSignUp: String = ""
    @State private var confirmPassw: String = ""
    @State private var passwSignIn: String = ""
    @State private var showPageTwo = false
    @State private var isSecured: Bool = true
    private var title: String
    private var isSecureField: Bool
    init(_ title: String, isSecureField: Bool = false) {
        self.title = title
        self.isSecureField = isSecureField
    }
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 300, height: 400)
                .cornerRadius(20)
                .foregroundColor(.white)
                .padding(.top, -50)
            
            VStack {
                Picker(selection: $selectedOption, label: Text("")) {
                    Text("Sign In").tag(0)
                    Text("Sign Up").tag(1)
                }
                .frame(width: 200)
                .padding(.top, -40)
                .pickerStyle(SegmentedPickerStyle())
                
                if selectedOption == 0 {
                    TextField("Email", text: $emailSignIn)
                        .frame(width: 220)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing, -5)
                        .padding(.top, 5)
                    
                    if isSecureField {
                        ZStack(alignment: .trailing) {
                            if isSecured {
                                SecureField(title, text: $passwSignIn)
                            } else {
                                TextField(title, text: $passwSignIn)
                            }
                            
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }
                        }
                        .frame(width: 220)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing, -5)
                        .padding(.top, 5)
                    } else {
                        TextField(title, text: $passwSignIn)
                            .frame(width: 220)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, -5)
                            .padding(.top, 5)
                    }
                    
                    Button(action: {
                        if emailSignIn.isEmpty || passwSignIn.isEmpty {
                            showAlert = true
                        } else {
                           showPageTwo = true
                        }
                    }) {
                        Text("Sign In")
                            .frame(width: 200, height: 30)
                            .fullScreenCover(isPresented: $showPageTwo) {
                                FirstStart()
                            }
                    }
                    .cornerRadius(30)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("blue"))
                    .padding(.top, 30)
                    
                    
                }
                else {
                    TextField("Email", text: $emailSignUp)
                        .frame(width: 220)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing, -5)
                        .padding(.top, 5)
                    
                    if isSecureField {
                        ZStack(alignment: .trailing) {
                            if isSecured {
                                SecureField(title, text: $passwSignUp)
                            } else {
                                TextField(title, text: $passwSignUp)
                            }
                            
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }
                        }
                        .frame(width: 220)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing, -5)
                        .padding(.top, 5)
                    } else {
                        TextField(title, text: $passwSignUp)
                            .frame(width: 220)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, -5)
                            .padding(.top, 5)
                    }
                    
                    if isSecureField {
                        ZStack(alignment: .trailing) {
                            if isSecured {
                                SecureField(title, text: $confirmPassw)
                            } else {
                                TextField(title, text: $confirmPassw)
                            }
                            
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }
                        }
                        .frame(width: 220)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing, -5)
                        .padding(.top, 5)
                    } else {
                        TextField(title, text: $confirmPassw)
                            .frame(width: 220)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, -5)
                            .padding(.top, 5)
                    }
                    
                    
                    Text("Forgot Password?")
                        .font(.custom("Sukhumvit Set Thin", size: 10))
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                        .padding(.leading, 150)
                    
                    Button(action:{
                        if self.passwSignUp == self.confirmPassw {}
                        else {}})
                    {
                        Text("Sign Up")
                            .frame(width: 200, height: 30)
                    }
                    .cornerRadius(30)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("blue"))
                    .padding(.top, 10)
                    .disabled(passwSignUp != confirmPassw)
                }
                VStack {
                    Divider()
                        .frame(width: 130)
                        .padding(.leading, 160)
                    Text("Or")
                        .padding(.top, -20)
                    Divider()
                        .frame(width: 130)
                        .padding(.trailing, 160)
                        .padding(.top, -20)
                    
                }
                .padding(.top, 30)
                
                HStack(spacing: 20){
                    Button(action: {
                        if let url = URL(string: "http://www.facebook.com") {
                            UIApplication.shared.open(url)}
                    }) {
                        Image("facebook")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Button(action: {
                        if let url = URL(string: "http://www.google.com") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image("google")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Card Label and Card Number must not be empty."),
                dismissButton: .default(Text("OK"))
            )
        }

    }
}
