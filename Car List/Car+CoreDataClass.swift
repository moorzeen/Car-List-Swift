//
//  Car+CoreDataClass.swift
//  Car List
//
//  Created by Лёха on 02/03/2019.
//  Copyright © 2019 Moorzeen. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Car)
public class Car: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Car"), insertInto: CoreDataManager.instance.context)
    }
}
