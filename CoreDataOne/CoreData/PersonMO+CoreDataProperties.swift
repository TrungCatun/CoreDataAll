//
//  PersonMO+CoreDataProperties.swift
//  CoreDataOne
//
//  Created by Trung on 11/7/18.
//  Copyright © 2018 Trung. All rights reserved.
//
//

import Foundation
import CoreData


extension PersonMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonMO> {
        return NSFetchRequest<PersonMO>(entityName: "Person")
    }

    @NSManaged public var dateOfBirth: NSDate?
    @NSManaged public var name: String?

}
