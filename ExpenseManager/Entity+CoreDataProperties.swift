//
//  Entity+CoreDataProperties.swift
//  ExpenseManager
//
//  Created by Farid Gahramanov on 21.09.23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var bankOption: String?
    @NSManaged public var cardLabel: String?
    @NSManaged public var cardNumber: String?

}

extension Entity : Identifiable {

}
