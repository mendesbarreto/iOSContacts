//
//  Phone+CoreDataProperties.swift
//  iOSContacts
//
//  Created by Douglas Barreto on 30/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//
//

import Foundation
import CoreData


extension Phone {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Phone> {
        return NSFetchRequest<Phone>(entityName: "Phone")
    }

    @NSManaged public var number: Int32
    @NSManaged public var type: Int16
    @NSManaged public var user: User?

}
