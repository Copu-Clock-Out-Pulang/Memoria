//
//  ScrapBookCarouselCard.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapBookCarouselCard: View {
    private let scrapPageCardImage: Image = I.scrapPageCard.swiftUIImage
    private let scrapPageFilterImage: Image = I.scrapPageFilter.swiftUIImage

    var scrapPageName: String
    var scrapPageThumbnail: String
    var scrapPageContent: String

    var body: some View {
        GeometryReader {
            geometry in
            ZStack {
                // ScrapPageCard
                scrapPageCardImage
                    .resizable()
                    .scaledToFit()

                // ScrapPageThumbnail
                Image(uiImage: (UIImage(data: Data(base64Encoded: scrapPageThumbnail)!) ?? UIImage(named: "ScrapPageThumbnailDummy"))!)
                    .resizable()
                    .scaledToFit()
                    .mask(
                        RoundedRectangle(
                            cornerRadius: 16
                        )
                        .frame(
                            width: geometry.size.width * 0.8,
                            height: geometry.size.height * 0.8
                        )
                    )

                // ScrapPageFilter
                scrapPageFilterImage
                    .resizable()
                    .scaledToFit()
                // ScrapPageName
                Text(scrapPageName)
                    .font(.custom("LilitaOne", fixedSize: 24))
                    .padding(.trailing, geometry.size.width * 0.35)
                    .padding(.top, geometry.size.height * 0.6).foregroundColor(.white)
            }
        }
    }
}
