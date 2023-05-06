//
//  ScrapBookDetailView.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import SwiftUI

struct ScrapBookDetailView: View {
    var body: some View {
        GeometryReader {
            _ in
            ZStack {
                ScrapBookDetailBackground()
                VStack {
                    Spacer()
                    ScrapBookCard(
                        tripName: "Trip Name",
                        tripDate: "27 Jan - 3 Feb 2023",
                        tripDescription:
                            "Liburan terbaik bukanlah soal kemewahan, tetapi soal kebersamaan di tengah keluarga tercinta."
                        //                        "Jalan-jalan ke kota baru"
                    )
                }
            }
        }
    }
}
