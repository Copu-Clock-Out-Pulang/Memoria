//
//  ScrapPageDeleteButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageDeleteButton: View {
    var body: some View {
        Button(action: {
            // insert editScrapBookfunction from view model
            print("scrap book delete button pressed")
        }
        ) {
            I.deleteButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
