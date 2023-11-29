//
//  BackgroundComponent.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import SwiftUI

struct ScrapBookDetailBackground: View {
    var body: some View {
        GeometryReader {
            geometry in
            I.backgroundScrapBookDetail.swiftUIImage
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
        }
    }
}
