//
//  ScrapPageEditButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageEditButton: View {

    @EnvironmentObject var controller: ScrapBookDetailViewController
    @Binding var isConfirmationDialogOpened: Bool
    var body: some View {
        Button(action: {
            isConfirmationDialogOpened.toggle()
            print("scrap page edit button pressed")
        }) {
            I.editScrapPageButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
