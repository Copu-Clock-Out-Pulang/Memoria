//
//  ScrapBookEditButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapBookEditButton: View {
    @State var name: String
    @State var startDate: Date
    @State var endDate: Date
    @State var quote: String
    @State var showSheet: Bool
    var body: some View {
        Button(action: {
            showSheet = true
            print("scrapbook edit button pressed")
        }
        ){
            I.editButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
        .sheet(isPresented: $showSheet) {
                EditScrapBookDetailSheet(name: $name, startDate: $startDate, endDate: $endDate, quote: $quote, showSheet: $showSheet)
            }
    }
}
