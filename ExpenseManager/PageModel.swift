//
//  PageModel.swift
//  ExpenseManager
//
//  Created by Farid Gahramanov on 16.09.23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name = String()
    var image = String()
    var describtion = String()
    var tag = Int()
    
    static var samplePage = Page(name: "SpendWise", image: "logoGuy", describtion: "Control Your Cash, Control Your Future", tag: 0)
    
    static var samplePages : [Page] = [
        Page(name: "SpendWise", image: "logoGuy", describtion: "Control Your Cash, Control Your Future", tag: 0),
        Page(name: "SpendWise", image: "logoGirl", describtion: "Say goodbye to financial stress and hello to financial freedom.", tag: 1),
        Page(name: "SpendWise", image: "logoGuy2", describtion: "Easily track expenses and set budgets.\nSet up your acount right now!", tag: 2),
    ]
    
}

struct Bank: Identifiable {
    let id = UUID()
    var name = String()
    var image = String()
    var tag = Int()
    
    static var data: [Bank] = [
        Bank(name: "Choose your Bank", image: "ABB", tag: 0),
        Bank(name: "ABB", image: "ABB", tag: 1),
        Bank(name: "Kapital Bank", image: "ABB", tag: 2),
        Bank(name: "AFB", image: "ABB", tag: 3),
        Bank(name: "Pasha Bank", image: "ABB", tag: 4),
        Bank(name: "Gunay Bank", image: "ABB", tag: 5),
    ]
}
