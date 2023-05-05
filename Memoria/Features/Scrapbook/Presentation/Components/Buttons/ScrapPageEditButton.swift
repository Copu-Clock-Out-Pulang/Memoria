//
//  ScrapPageEditButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageEditButton: View {
    //    let onButtonClick: () -> Void
    @EnvironmentObject var controller: ScrapBookDetailViewController
    var body: some View {
        Button(action: {
            print("scrap page edit button pressed")
            // insert editScrapBookfunction from view model
            //            onButtonClick()
            controller.navigateToScrapPageEditor()
        }
        ) {
            I.editScrapPageButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
