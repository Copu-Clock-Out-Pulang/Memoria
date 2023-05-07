//
//  ScrapPageEditButton.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapPageEditButton: View {
    //    let onButtonClick: () -> Void
    @EnvironmentObject var controller: ScrapBookDetailViewController
    @State private var isConfirmationDialogOpened = false
    var body: some View {
        Button(action: {
            controller.navigateToScrapPageEditor(scrapPage: controller.scrapPage!)
            isConfirmationDialogOpened.toggle()
            print("scrap page edit button pressed")
        }) {
            I.editScrapPageButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }
    }
}

// struct ScrapPageEditButton: View {
//    @EnvironmentObject var controller: ScrapBookDetailViewController
//    @State private var isConfirmationDialogOpened = false
//
//    var body: some View {
//        Button(action: {
//            isConfirmationDialogOpened.toggle()
//        }) {
//            I.editScrapPageButtonIcon.swiftUIImage.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
//        }
//        .overlay(
//            EditScrapPageDialog(
//                title: "Confirmation",
//                message: "Do you want to edit the scrap page?",
//                isShown: $isConfirmationDialogOpened,
//                primaryButtonTitle: "Edit scrap page name",
//                primaryButtonAction: {
//
//                },
//                secondaryButtonTitle: "Edit scrap page",
//                secondaryButtonAction: {
//                    controller.navigateToScrapPageEditor(scrapPage: controller.scrapPage!)
//                }
//            )
//        )
//    }
// }
//
// struct EditScrapPageDialog: View {
//    let title: String
//    let message: String
//    @Binding var isShown: Bool
//    let primaryButtonTitle: String
//    let primaryButtonAction: () -> Void
//    let secondaryButtonTitle: String
//    let secondaryButtonAction: () -> Void
//
//    var body: some View {
//        if isShown {
//            ZStack {
//                Color.gray.opacity(0.4).ignoresSafeArea()
//                VStack(spacing: 16) {
//                    Text(title)
//                        .font(.title)
//                        .bold()
//                        .padding(.top, 16)
//                    Text(message)
//                        .font(.headline)
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal, 16)
//                    Divider()
//                    HStack(spacing: 16) {
//                        Button(action: {
//                            isShown = false
//                        }) {
//                            Text(secondaryButtonTitle)
//                                .foregroundColor(.red)
//                        }
//                        .frame(maxWidth: .infinity)
//                        Button(action: {
//                            isShown = false
//                            primaryButtonAction()
//                        }) {
//                            Text(primaryButtonTitle)
//                                .bold()
//                                .frame(maxWidth: .infinity)
//                        }
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .cornerRadius(8)
//                    }
//                    .padding(.horizontal, 16)
//                    .padding(.bottom, 16)
//                    .background(Color.white)
//                    .cornerRadius(16)
//                    .shadow(radius: 8)
//                }
//            }
//        }
//    }
// }
