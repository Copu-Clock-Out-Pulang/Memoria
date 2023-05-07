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
    @Binding var isConfirmationDialogOpened: Bool
    var body: some View {
        Button(action: {
//            controller.navigateToScrapPageEditor(scrapPage: controller.scrapPage!)
            isConfirmationDialogOpened.toggle()
            print("scrap page edit button pressed")
        }) {
            I.editScrapPageButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
