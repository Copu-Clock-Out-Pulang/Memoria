//
//  TripFamilyPhotoViewUI.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import SwiftUI
import PhotosUI

struct TripFamilyPhotoViewUI: View {
    @State var familyPhoto: PhotosPickerItem?
    
    @ObservedObject var viewModel: DestinationViewModel
    let controller: TripFamilyPhotoViewController
    var body: some View {
        ZStack {
            I.tripBackground5.swiftUIImage.resizable().scaledToFill()
            VStack(spacing: 20) {
                Spacer()
                Text(S.dstAddYourFamilyPhoto)
                    .font(Font.custom("LilitaOne", size: 40))
                    .multilineTextAlignment(.center
                    )
                    .foregroundColor(I.textPrimary.swiftUIColor)
                    .padding()
                if viewModel.familyPhoto == nil {
                    I.familyIllustration.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(Angle(degrees: -11))
                } else {
                    let image = Image(uiImage: viewModel.familyPhoto!)

                    if viewModel.familyPhoto!.size.height > viewModel.familyPhoto!.size.width {
                        PhoneFrame(image: image).rotationEffect(Angle(degrees: -140))
                    } else {
                        PhoneFrame(image: image).rotationEffect(Angle(degrees: -11))
                    }


                }
                Button {

                }
                label: {
                    HStack {
                        Text(S.dstSelectFromGallery)
                            .font(Font.custom("Poppins-Bold", size: 20))

                    }.frame(maxWidth: .infinity, minHeight: 50)

                }
                .background(I.secondaryButton.swiftUIColor)
                .foregroundColor(.white)

                .clipShape(Capsule())
                .shadow(radius: 2, y: 3)
                .padding(.horizontal, 40)


                Button {

                }
                label: {
                    Text(S.dstTakePhoto)
                        .font(Font.custom("Poppins-Bold", size: 20))
                        .frame(maxWidth: .infinity, minHeight: 50)

                }

                .background(.white)
                .cornerRadius(25)
                .foregroundColor(I.secondaryButton.swiftUIColor)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(I.secondaryButton.swiftUIColor, lineWidth: 3))


                .shadow(radius: 2, y: 3)
                .padding(.horizontal, 40)

                Spacer()
                Button {
                }
                label: {
                    Text(S.dstDone.uppercased())
                        .font(Font.custom("Poppins-Bold", size: 20))
                        .frame(maxWidth: .infinity, minHeight: 50)

                }
                .disabled(viewModel.familyPhoto == nil)
                .background(viewModel.familyPhoto == nil ?
                                I.disabledButton.swiftUIColor :
                                I.primaryButton.swiftUIColor)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .shadow(radius: 2, y: 3)
                .padding(.horizontal, 40)
                .padding(.bottom, 80)


            }


        }
        .ignoresSafeArea()
    }
}

struct TripFamilyPhotoViewUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let controller = TripFamilyPhotoViewController(viewModel: viewModel)
        TripFamilyPhotoViewUI(viewModel: viewModel, controller: controller)
    }
}
