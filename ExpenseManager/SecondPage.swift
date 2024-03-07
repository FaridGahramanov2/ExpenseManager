//  SecondPage.swift
//  ExpenseManager
//
//  Created by Farid Gahramanov on 21.09.23.
//

import SwiftUI

struct SecondPage: View {
    @Binding var cardLabel: String
    @Binding var card: String
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .padding(.top, -600)
                    .padding(.leading, -50)
                    .foregroundColor(Color("blue"))
                
                Color("green")
                    .edgesIgnoringSafeArea(.all)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 200)
                        .padding(.bottom, 500)
                        .foregroundColor(Color("blue"))
                    
                    Text("\(cardLabel)")
                        .foregroundColor(.black)
                        .padding(.bottom, 630)
                        .lineLimit(1)
                        .multilineTextAlignment(.trailing)
                        .font(.custom("Sukhumvit Set Thin", size: 25))
                    Text("Total Balance:\n$ 166.98")
                        .foregroundColor(.black)
                        .padding(.bottom, 500)
                        .padding(.trailing, 150)
                        .font(.custom("Sukhumvit Set Thin", size: 20))
                    Text("\(card)")
                        .foregroundColor(.black)
                        .padding(.bottom, 350)
                        .lineLimit(1)
                        .multilineTextAlignment(.trailing)
                        .font(.custom("Sukhumvit Set Thin", size: 20))
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 400, height: 600)
                        .padding(.top, 500)
                        .foregroundColor(Color("blue"))
                    Text("DATA of EXPENSES")
                }
                
            }
        }
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        let cardLabel = Binding<String>(
            get: { "Farid Personal" },
            set: { _ in }
        )
        
        let card = Binding<String>(
            get: { "4127209311036849" },
            set: { _ in }
        )
        
        return SecondPage(cardLabel: cardLabel, card: card)
    }
}
