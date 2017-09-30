//
//  Address+CoreDataProperties.swift
//  iOSContacts
//
//  Created by Douglas Barreto on 30/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?
    @NSManaged public var neighbourhood: String?
    @NSManaged public var number: String?
    @NSManaged public var street: String?
    @NSManaged public var zipCode: Int16
    @NSManaged public var user: User?

}
