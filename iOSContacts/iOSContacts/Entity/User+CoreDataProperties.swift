//
//  User+CoreDataProperties.swift
//  iOSContacts
//
//  Created by Douglas Barreto on 30/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var lastName: String?
    @NSManaged public var birthDay: NSDate?
    @NSManaged public var address: User?

}
