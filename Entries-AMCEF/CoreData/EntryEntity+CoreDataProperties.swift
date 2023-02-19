//
//  EntryEntity+CoreDataProperties.swift
//  
//
//  Created by Dávid Baľak on 18/02/2023.
//
//

import Foundation
import CoreData


extension EntryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntryEntity> {
        return NSFetchRequest<EntryEntity>(entityName: "EntryEntity")
    }

    @NSManaged public var api: String?
    @NSManaged public var category: String?
    @NSManaged public var isApiKeyUsed: Bool
    @NSManaged public var entryDesc: String?
    @NSManaged public var isHTTPS: Bool
    @NSManaged public var link: String?

}
