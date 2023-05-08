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

    @State var scrapPage: ScrapPage?
    var body: some View {
        
        
        let sharedPhoto = scrapPage == nil ? I.scrapPageThumbnailNew.swiftUIImage :  Image(uiImage: UIImage(data: Data(base64Encoded: scrapPageViewModel.scrapPage!.thumbnail)!)!)
    
        ShareLink(item: sharedPhoto, preview: SharePreview(scrapPage?.name ?? "", image: sharedPhoto)) {
            I.shareButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
        .onAppear {
            guard let scrapPage = scrapPageViewModel.scrapPage else {
                return
            }
            self.scrapPage = scrapPage
        }

    }
}
