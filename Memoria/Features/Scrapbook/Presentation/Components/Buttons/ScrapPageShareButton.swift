//
//  ScrapPageShareButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageShareButton: View {
    var body: some View {
        Button(action: {
            // insert editScrapPagefunction from view model
            print("scrap book share button pressed")
        }
        ) {
            I.shareButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
