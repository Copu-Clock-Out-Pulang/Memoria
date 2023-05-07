//
//  ScrapBookDetailView.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import SwiftUI

struct ScrapBookDetailView: View {

    @ObservedObject var controller: ScrapBookDetailViewController
    @ObservedObject var scrapBookViewModel: ScrapBookViewModel
    @ObservedObject var scrapPageViewModel: ScrapPageViewModel

    var body: some View {
        GeometryReader {
            _ in
            ZStack {
                ScrapBookDetailBackground()
                VStack {
                    Spacer()
                    ScrapBookCard(
                        tripName: controller.getScrapBookInfo().name ?? "Trip Name",
                        tripDate:
                        controller.getScrapBookInfo().tripDate ??
                            "27 Jan - 3 Feb 2023",
                        tripDescription:
                            controller.getScrapBookInfo().tripDescription ??
                            "Liburan terbaik bukanlah soal kemewahan, tetapi soal kebersamaan di tengah keluarga tercinta.", scrapPages: controller.scrapBook?.scrapPages ?? []
                    )
                }
            }
        }.environmentObject(scrapBookViewModel)
        .environmentObject(scrapPageViewModel)
        .environmentObject(controller)
    }
}
