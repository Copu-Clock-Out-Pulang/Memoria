//
//  ScrapPageShareButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageShareButton: View {
    @EnvironmentObject var controller: ScrapBookDetailViewController
    
    var body: some View {
        var image = Image(uiImage: controller.shareSelectedPage())
        
        Button(action: {
//            ShareLink(item: image, preview: SharePreview("", image))
//             insert editScrapPagefunction from view model
            print("scrap book share button pressed")
        }
        ) {
            I.shareButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}
