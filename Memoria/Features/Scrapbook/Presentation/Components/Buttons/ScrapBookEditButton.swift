//
//  ScrapBookEditButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapBookEditButton: View {
    var body: some View {
        Button(action: {
            // insert editScrapBookfunction from view model
            print("scrapbook edit button pressed")
        }
        ) {
            I.editButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
