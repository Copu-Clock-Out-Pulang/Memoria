//
//  SquareSeparator.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import SwiftUI


struct ScrapBookCard: View {
    @State var tripName: String // 25 characters
    @State var tripDate: String // E.g. case: 27 Jan - 3 Feb 2023
    @State var tripDescription: String // 100 characters

    private let gradientColors = [
        I.textPrimary.swiftUIColor,
        I.textPrimary.swiftUIColor, .black.opacity(0.300)
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
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(tripName)
                                .font(.custom("LilitaOne", fixedSize: 36))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                            ScrapBookEditButton().padding(.leading, geometry.size.width * 0.25)
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
                        .padding(.trailing, geometry.size.width * 0.3)
                        .padding(.bottom, geometry.size.height * 0.65)
                    }
                    // scrapbook carousel
                }
                ScrapBookCarousel(selectedCard: 0)
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
