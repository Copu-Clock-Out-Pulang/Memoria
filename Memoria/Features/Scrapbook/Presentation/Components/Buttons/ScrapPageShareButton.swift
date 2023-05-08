//
//  ScrapPageShareButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageShareButton: View {
    @EnvironmentObject var controller: ScrapBookDetailViewController
    @EnvironmentObject var scrapPageViewModel: ScrapPageViewModel

    var body: some View {
        let sharedPhoto = Image(uiImage: UIImage(data: Data(base64Encoded: scrapPageViewModel.scrapPage!.thumbnail)!)!)

        ShareLink(item: sharedPhoto, preview: SharePreview(scrapPageViewModel.scrapPage!.name, image: sharedPhoto)) {
            I.shareButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }

    }
}
