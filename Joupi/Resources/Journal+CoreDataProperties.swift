//
//  Journal+CoreDataProperties.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 14/05/22.
//
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var title: String?
    @NSManaged public var coffeeName: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var altitude: Int32
    @NSManaged public var variety: String?
    @NSManaged public var roastDate: Date?
    @NSManaged public var roastLevel: String?
    @NSManaged public var process: String?
    @NSManaged public var beansFlavorNote: String?
    @NSManaged public var method: String?
    @NSManaged public var coffeeAmount: Int32
    @NSManaged public var waterAmount: Int32
    @NSManaged public var temperature: Int32
    @NSManaged public var imageUrls: NSObject?
    @NSManaged public var memo: String?
    @NSManaged public var experienceRating: Int32

}

extension Journal : Identifiable {

}
