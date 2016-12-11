//
//  Categories+CoreDataProperties.swift
//  MyCoreDataDemo
//
//  Created by Moeung Theara on 12/4/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories");
    }

    @NSManaged public var categoryName: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var id: String?
    @NSManaged public var pId: Int32
    @NSManaged public var product: NSSet?

}

// MARK: Generated accessors for product
extension Categories {

    @objc(addProductObject:)
    @NSManaged public func addToProduct(_ value: Product)

    @objc(removeProductObject:)
    @NSManaged public func removeFromProduct(_ value: Product)

    @objc(addProduct:)
    @NSManaged public func addToProduct(_ values: NSSet)

    @objc(removeProduct:)
    @NSManaged public func removeFromProduct(_ values: NSSet)

}
