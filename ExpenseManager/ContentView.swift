//
//  ContentView.swift
//  ExpenseManager
//
//  Created by Farid Gahramanov on 16.09.23.
//

import SwiftUI

struct ContentView: View {
    @State private var signIn = false
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationView{
            VStack {
                if pageIndex == 0 {
                    
                    
                    Button(action: { signIn = true }) {
                        Image("signIn")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.leading, 300)
                    }
                    NavigationLink("", destination:  SignInPage(), isActive: $signIn)
                    
                }
                
                
                TabView(selection: $pageIndex){
                    ForEach(pages) { page in
                        VStack {
                            
                            PageTwo(page: page)
                            
                            if page == pages.last {
                                
                                Button("Sign Up!", action: goToZero)
                                
                                
                            } else {
                                Button("next", action: plusPage)
                            }
                            
                            
                        }
                        .tag(page.tag)
                    }
                }
                
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .onAppear{
                    dotAppearance.currentPageIndicatorTintColor = .black
                    dotAppearance.pageIndicatorTintColor = .gray
                    
                }
                
            }
        }
      
    }
    func plusPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
