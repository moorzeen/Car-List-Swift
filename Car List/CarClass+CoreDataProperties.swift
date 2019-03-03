//
//  CarClass+CoreDataProperties.swift
//  Car List
//
//  Created by Лёха on 02/03/2019.
//  Copyright © 2019 Moorzeen. All rights reserved.
//
//

import Foundation
import CoreData


extension CarClass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarClass> {
        return NSFetchRequest<CarClass>(entityName: "CarClass")
    }

    @NSManaged public var name: String?
    @NSManaged public var car: NSSet?

}

// MARK: Generated accessors for car
extension CarClass {

    @objc(addCarObject:)
    @NSManaged public func addToCar(_ value: Car)

    @objc(removeCarObject:)
    @NSManaged public func removeFromCar(_ value: Car)

    @objc(addCar:)
    @NSManaged public func addToCar(_ values: NSSet)

    @objc(removeCar:)
    @NSManaged public func removeFromCar(_ values: NSSet)

}
