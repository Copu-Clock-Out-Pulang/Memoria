//
//  SquareSeparator.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import SwiftUI


struct ScrapBookCard: View {
    @EnvironmentObject var scrapBookViewModel: ScrapBookViewModel
    @EnvironmentObject var scrapPageViewModel: ScrapPageViewModel

    @State var tripName: String // 25 characters
    @State var tripDate: String // E.g. case: 27 Jan - 3 Feb 2023
    @State var tripDescription: String // 100 characters

    let scrapPages: [ScrapPage]
    //    let onButtonClick: () -> Void

    private let gradientColors = [
        I.textPrimary.swiftUIColor,
        I.textPrimary.swiftUIColor, .black.opacity(0.3)
    ]

    private let scrapBookDetailDecal = I.scrapBookDetailBackgroundDecal.swiftUIImage

    var body: some View {
        GeometryReader {
            geometry in
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: gradientColors
                    ),
                    startPoint: .top,
                    endPoint: .bottomTrailing
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30)
                )
                .frame(width: geometry.size.width, height: geometry.size.height)
                .padding(.trailing, geometry.size.width * 0.050)
                .padding(.vertical, geometry.size.height * 0.100)
                VStack {
                    scrapBookDetailDecal
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height * 0.270)
                        .offset(x: geometry.size.width * 0.110, y: geometry.size.height * -0.380)
                }
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(tripName)
                                .font(.custom("LilitaOne", fixedSize: 36))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.leading, geometry.size.width * 0.05)
                            Spacer()
                            ScrapBookEditButton()
                                .padding(.trailing, geometry.size.width * 0.15)
                        }
                        VStack(alignment: .leading, spacing: -0.41) {
                            Text(tripDate)
                                .font(.custom("Poppins-Italic", fixedSize: 16))
                                .foregroundColor(.white)
                            Text(tripDescription)
                                .font(.custom("Poppins-Regular", fixedSize: 16))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)

                        }.frame(
                            width: geometry.size.width * 0.617,
                            height: geometry.size.height * 0.206,
                            alignment: .leading)
                        .padding(.leading, geometry.size.width * 0.05)
                        .padding(.bottom, geometry.size.height * 0.65)
                    }
                    // scrapbook carousel
                }
                ScrapBookCarousel(selectedCard: 0, scrapPages: scrapBookViewModel.scrapBook?.scrapPages ?? [])
                    .offset(x: 0, y: geometry.size.height * 0.3)
                HStack(alignment: .center) {
                    ScrapPageEditButton()
                    ScrapPageShareButton()
                    ScrapPageDeleteButton()
                }.padding(.top, geometry.size.height * 0.6)
            }
        }.ignoresSafeArea()
    }
}
