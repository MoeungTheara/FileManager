//
//  Product+CoreDataProperties.swift
//  MyCoreDataDemo
//
//  Created by Moeung Theara on 12/4/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product");
    }

    @NSManaged public var categoryID: Int32
    @NSManaged public var image: String?
    @NSManaged public var pId: String?
    @NSManaged public var pName: String?
    @NSManaged public var pPrice: Double
    @NSManaged public var pQTy: Int16
    @NSManaged public var category: Categories?

}
