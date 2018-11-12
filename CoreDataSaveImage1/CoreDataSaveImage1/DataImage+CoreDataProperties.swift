//
//  DataImage+CoreDataProperties.swift
//  
//
//  Created by Trung on 11/12/18.
//
//  This file was automatically generated and should not be edited.
//

import UIKit
import CoreData


extension DataImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataImage> {
        return NSFetchRequest<DataImage>(entityName: "DataImage")
    }

    @NSManaged public var image: UIImage?

}
