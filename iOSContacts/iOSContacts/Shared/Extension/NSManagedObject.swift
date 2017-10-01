//
// Created by Douglas Barreto on 30/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import CoreData

extension NSManagedObject {
    public class var entityName: String {
        return String(describing: self)
    }
}
