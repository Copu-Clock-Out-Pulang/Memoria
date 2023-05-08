//
//  ScrapPageDeleteButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageDeleteButton: View {
    @EnvironmentObject var controller: ScrapBookDetailViewController
    @EnvironmentObject var scrapPageViewModel: ScrapPageViewModel
    @State private var showingAlert = false
    @Binding var selectedCard: Int

    var body: some View {
        Button(action: {
            showingAlert = true
        }) {
            I.deleteButtonIcon.swiftUIImage
                .renderingMode(.original)
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Delete Scrap Page"),
                message: Text("Are you sure you want to delete this scrap page?"),
                primaryButton: .destructive(Text("Delete")) {
                    controller.deleteScrapPage(scrapPage: scrapPageViewModel.scrapPage!, nextScrapPage: (controller.scrapBook?.scrapPages[1])!)
                    controller.viewDidAppear(true)
                    selectedCard = 0
                },
                secondaryButton: .cancel()
            )
        }
    }
}
