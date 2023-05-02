//
//  ScrapPageCoreDataModel+CoreDataProperties.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//
//

import Foundation
import CoreData


extension ScrapPageCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScrapPageCoreDataModel> {
        return NSFetchRequest<ScrapPageCoreDataModel>(entityName: "ScrapPageCoreDataModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var content: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var scrapBook: ScrapBookCoreDataModel?

}

extension ScrapPageCoreDataModel: Identifiable {

}

extension ScrapPageCoreDataModel {
    func toDomain() -> ScrapPage {
        return ScrapPage(
            id: self.id!,
            name: self.name!,
            thumbnail: self.thumbnail!,
            content: self.content!,
            createdAt: self.createdAt!,
            updatedAt: self.updatedAt!
        )
    }
    static func fromDomain(form: CreateScrapPageForm) -> ScrapPageCoreDataModel {

        var model = ScrapPageCoreDataModel()

        model.id = UUID()
        model.name = "new scrap page"
        model.thumbnail = ""
        model.content = ""
        model.createdAt = Date.now
        model.updatedAt = Date.now

        return model

    }

    static func fromDomain(form: EditScrapPageForm) -> ScrapPageCoreDataModel {
        var model = ScrapPageCoreDataModel()

        model.name = form.name
        model.thumbnail = form.thumbnail
        model.content = form.content
        model.updatedAt = Date.now

        return model

    }

    static func fromDomain(scrapPage: ScrapPage) -> ScrapPageCoreDataModel {
        var model = ScrapPageCoreDataModel()

        model.id = scrapPage.id
        model.name = scrapPage.name
        model.content = scrapPage.content
        model.createdAt = scrapPage.createdAt
        model.updatedAt = scrapPage.updatedAt
        model.thumbnail = scrapPage.thumbnail

        return model
    }


}
