//
//  Car+CoreDataProperties.swift
//  Car List
//
//  Created by Лёха on 02/03/2019.
//  Copyright © 2019 Moorzeen. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var bodyType: String?
    @NSManaged public var carClass: String?
    @NSManaged public var manufacturer: String?
    @NSManaged public var model: String?
    @NSManaged public var year: Int16
    @NSManaged public var bodytype: BodyType?
    @NSManaged public var carclass: CarClass?

}
