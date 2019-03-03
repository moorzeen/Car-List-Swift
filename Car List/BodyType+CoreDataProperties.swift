//
//  BodyType+CoreDataProperties.swift
//  Car List
//
//  Created by Лёха on 02/03/2019.
//  Copyright © 2019 Moorzeen. All rights reserved.
//
//

import Foundation
import CoreData


extension BodyType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BodyType> {
        return NSFetchRequest<BodyType>(entityName: "BodyType")
    }

    @NSManaged public var name: String?
    @NSManaged public var car: NSSet?

}

// MARK: Generated accessors for car
extension BodyType {

    @objc(addCarObject:)
    @NSManaged public func addToCar(_ value: Car)

    @objc(removeCarObject:)
    @NSManaged public func removeFromCar(_ value: Car)

    @objc(addCar:)
    @NSManaged public func addToCar(_ values: NSSet)

    @objc(removeCar:)
    @NSManaged public func removeFromCar(_ values: NSSet)

}
