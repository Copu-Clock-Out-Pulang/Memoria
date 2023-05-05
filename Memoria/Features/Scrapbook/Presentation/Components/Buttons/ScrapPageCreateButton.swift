//
//  ScrapPageCreateButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 05/05/23.
//

import SwiftUI

struct ScrapPageCreateButton: View {
    var body: some View {
        Button(action: {
            // insert editScrapBookfunction from view model
            print("scrapbook edit button pressed")
        }
        ) {
            I.addScrapPageButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
