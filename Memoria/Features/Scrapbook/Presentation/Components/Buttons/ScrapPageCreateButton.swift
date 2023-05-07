//
//  ScrapPageCreateButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 05/05/23.
//

import SwiftUI

struct ScrapPageCreateButton: View {
    @EnvironmentObject var controller: ScrapBookDetailViewController
    var body: some View {
        Button(action: {
            controller.addScrapPage()
            controller.viewDidLoad()
            print("scrapbook edit button pressed")
        }
        ) {
            I.addScrapPageButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
