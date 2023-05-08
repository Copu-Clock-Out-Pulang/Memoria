//
//  ScrapBookCard.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import SwiftUI

struct ScrapBookCard: View {
    @EnvironmentObject var scrapBookViewModel: ScrapBookViewModel
    @EnvironmentObject var scrapPageViewModel: ScrapPageViewModel
    @EnvironmentObject var controller: ScrapBookDetailViewController

    @State var tripName: String // 25 characters
    @State var tripDate: String // E.g. case: 27 Jan - 3 Feb 2023
    @State var tripDescription: String // 100 characters
    @State var scrapPageName: String = ""

    @State var selectedCard: Int = 0

    @State var showSheet = false
    @State var showTextAlert = false
    @State private var isConfirmationDialogOpened = false
//    @State var selectedScrapPage = ScrapPage(id: UUID(), name: "", thumbnail: "", content: "", createdAt: Date(), updatedAt: Date())
    let scrapPages: [ScrapPage]
    //    let onButtonClick: () -> Void

    private let gradientColors = [
        I.textPrimary.swiftUIColor,
        I.textPrimary.swiftUIColor, .black.opacity(0.3)
    ]

    private let scrapBookDetailDecal = I.scrapBookDetailBackgroundDecal.swiftUIImage

    func saveEditedScrapPage() {
        scrapPageViewModel.saveScrapPage(name: scrapPageName, thumbnail: scrapPageViewModel.scrapPage!.thumbnail, content: scrapPageViewModel.scrapPage!.content)
        controller.viewDidAppear(true)
    }
    
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
                            ScrapBookEditButton(name: tripName, startDate: (controller.getScrapBook().startDate) ?? Date(), endDate: (controller.getScrapBook().endDate) ?? Date(), quote: tripDescription, showSheet: showSheet)
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
                ScrapBookCarousel(selectedCard: $selectedCard, scrapPages: scrapBookViewModel.scrapBook?.scrapPages ?? [])
                    .offset(x: 0, y: geometry.size.height * 0.3)
                HStack(alignment: .center) {
                    if !(scrapBookViewModel.scrapBook?.scrapPages.isEmpty)! && selectedCard != 0 {
                        ScrapPageEditButton(isConfirmationDialogOpened: $isConfirmationDialogOpened)
                        ScrapPageShareButton()
                        ScrapPageDeleteButton(selectedCard: $selectedCard)
                    }
                }.padding(.top, geometry.size.height * 0.6)
            }
        }.confirmationDialog("Edit dialog", isPresented: $isConfirmationDialogOpened){
            Button("Edit Scrap Page Name", action: {
                isConfirmationDialogOpened = false
                showTextAlert = true
            })
            Button("Edit Scrap Page", action:
                    {
                isConfirmationDialogOpened = false
                controller.navigateToScrapPageEditor(scrapPage: scrapPageViewModel.scrapPage!)
            })
        }.alert("Edit ScrapPage", isPresented: $showTextAlert, actions: {
            TextField("Scrap Page Name", text: $scrapPageName)
            Button("Confirm", action: {
                saveEditedScrapPage()
            })
            Button("Cancel", role: .cancel, action: {})
        }, message: {
            Text("Please enter scrap page name.")
        }).ignoresSafeArea()

    }
}
