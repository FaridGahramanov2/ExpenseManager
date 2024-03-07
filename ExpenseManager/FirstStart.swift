//
//  FirstStart.swift
//  ExpenseManager
//
//  Created by Farid Gahramanov on 18.09.23.
//

import SwiftUI

struct FirstStart: View {
    @State private var cardLabel: String = ""
    @State private var card: String = ""
    let selectedOptionKey = "SelectedOption"
    @State private var selectedOptionIndex = 0
    @State private var showAlert = false
    @State private var showSecondPage = false
    @State private var cardLabelText = ""
    @State private var cardText = ""
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    Color("green")
                        .edgesIgnoringSafeArea(.all)
                    
                    Text("Let's set up your account!")
                        .font(.custom("Sukhumvit Set Thin", size: 50))
                        .fontDesign(.rounded)
                        .foregroundColor(.black)
                        .padding(.bottom, 450)
                    
                    Text("Balance")
                        .padding(.trailing, 300)
                        .font(.custom("Sukhumvit Set Thin", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 100)
                    
                    Text("$00.0")
                        .padding(.trailing, 250)
                        .font(.custom("Sukhumvit Set Thin", size: 50))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 400, height: 400)
                            .padding(.top, 480)
                            .foregroundColor(Color("blue"))
                        
                        GeometryReader { geometry in
                            TextField("  Card Label", text: $cardLabel)
                                .frame(width: geometry.size.width - 40, height: 55)
                                .background(Color.white)
                                .cornerRadius(10)
                                .position(x: geometry.size.width / 2, y: 550)
                            
                            TextField("  Card Number", text: $card)
                                .frame(width: geometry.size.width - 40, height: 55)
                                .background(Color.white)
                                .cornerRadius(10)
                                .position(x: geometry.size.width / 2, y: 620)
                                .textContentType(.creditCardNumber)
                                .keyboardType(.numberPad)
                                .onChange(of: card) { newValue in
                                    let cardNumber = String(newValue.filter({ $0.isNumber }))
                                    if cardNumber.count > 16 {
                                        card = String(cardNumber.prefix(16))
                                    } else {
                                        card = cardNumber
                                    }
                                }
                        }
                        
                        Button(action: {
                            if cardLabel.isEmpty || card.count != 16 {
                                showAlert = true
                            } else {
                                showSecondPage = true
                                cardLabelText = cardLabel
                                cardText = card
                            }
                        }) {
                            Text("Sign In")
                                .frame(width: 200, height: 30)
                                .foregroundColor(Color("blue"))
                                .fullScreenCover(isPresented: $showSecondPage) {
                                    SecondPage(cardLabel: $cardLabelText, card: $cardText)
                                }
                        }
                        .cornerRadius(30)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(.white))
                        .padding(.top, 650)
                        
                    }
                    
                    ZStack {
                        Pickers()
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
}

struct FirstStart_Previews: PreviewProvider {
    static var previews: some View {
        FirstStart()
    }
}

struct Pickers: View {
    @State private var selectedOptionIndex = 0
    let database = Bank.data
    let selectedOptionKey = "SelectedOption"
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 50)
            .padding(.top, 500)
            .foregroundColor(.white)
        
        
        Picker("Options", selection: $selectedOptionIndex) {
            ForEach(0..<database.count, id: \.self) { index in
                Text(database[index].name).tag(index)
            }
        }
        .pickerStyle(.menu)
        .padding(.top, 500)
        .frame(width: 400, height: 100)
        .foregroundColor(.white)
    }
}
