//
//  UserCoreDataModel+CoreDataProperties.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//
//

import Foundation
import CoreData


extension UserCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCoreDataModel> {
        return NSFetchRequest<UserCoreDataModel>(entityName: "UserCoreDataModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var scrapBooks: ScrapBookCoreDataModel?

}

extension UserCoreDataModel : Identifiable {

}
