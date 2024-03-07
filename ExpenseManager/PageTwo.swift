//
//  PageTwo.swift
//  ExpenseManager
//
//  Created by Farid Gahramanov on 16.09.23.
//

import SwiftUI

struct PageTwo: View {
    var page : Page
    var body: some View {
        VStack{
                
                Image("\(page.image)")
                    .resizable()
                    .frame(maxWidth: 400, maxHeight: 400)
                Text("\(page.name)")
                    .font(.custom("Sukhumvit Set Thin", size: 50))
                    .fontDesign(.rounded)
                Text("\(page.describtion)")
                    .font(.custom("Sukhumvit Set Thin", size: 20))
                    .fontDesign(.serif)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                
        }
    }
}
    
struct PageTwo_Previews: PreviewProvider {
    static var previews: some View {
        PageTwo(page: Page.samplePage)
    }
}
