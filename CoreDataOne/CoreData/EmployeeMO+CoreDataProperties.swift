//
//  EmployeeMO+CoreDataProperties.swift
//  CoreDataOne
//
//  Created by Trung on 11/7/18.
//  Copyright © 2018 Trung. All rights reserved.
//
//

import Foundation
import CoreData


extension EmployeeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeMO> {
        return NSFetchRequest<EmployeeMO>(entityName: "Employee")
    }

    @NSManaged public var hireDate: NSDate?
    @NSManaged public var identtyfier: String?
    @NSManaged public var isManager: Double
    @NSManaged public var stitle: String?
    @NSManaged public var department: DepartmentMO?

}
