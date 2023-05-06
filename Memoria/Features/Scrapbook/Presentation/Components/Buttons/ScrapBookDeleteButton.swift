//
//  ScrapPageDeleteButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageDeleteButton: View {
    @EnvironmentObject var controller: ScrapBookDetailViewController
    var body: some View {
        Button(action: {

            controller.viewDidLoad()
            print("scrap book delete button pressed")
        }
        ) {
            I.deleteButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
