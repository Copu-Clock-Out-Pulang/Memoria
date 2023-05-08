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
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var showCameraCaptureView = false
    @State private var capturedImage: UIImage?
    @State private var showConfirmation = false
    
    @ObservedObject var viewModel: DestinationViewModel
    let controller: TripFamilyPhotoViewController
    var body: some View {
        ZStack {
            I.TripBackgrounds.tripBackground5.swiftUIImage.resizable().scaledToFill()
            
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
                    if viewModel.familyPhoto!.size.height > viewModel.familyPhoto!.size.width {
                        let current = viewModel.familyPhoto!
                        let x = current.rotated(by: -270)
                        let image = Image(uiImage: x)
                        PhoneFrame(image: image).rotationEffect(Angle(degrees: -140))
                    } else {
                        let image = Image(uiImage: viewModel.familyPhoto!)
                        PhoneFrame(image: image).rotationEffect(Angle(degrees: -11))
                    }
                }
                
                Button {
                    showImagePicker.toggle()
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
                    showCameraCaptureView.toggle()
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
                
                VStack {
                    Button {
                        showConfirmation.toggle()
                        print("Done Clicked")
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
                    .padding(.bottom, 25)

                    Image("Indicators/5")
                        .padding(.bottom, 40)
                }
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: Binding<UIImage?>(
                get: {
                    self.selectedImage
                },
                set: {
                    self.selectedImage = $0
                    guard let image = $0 else {
                        return
                    }
                    viewModel.changeFamilyPhoto(familyPhoto: image)
                }
            ))
        }
        .sheet(isPresented: $showCameraCaptureView) {
            CameraCaptureView(capturedImage: Binding<UIImage?>(
                get: {
                    self.capturedImage
                },
                set: {
                    self.capturedImage = $0
                    guard let image = $0 else {
                        return
                    }
                    viewModel.changeFamilyPhoto(familyPhoto: image)
                }
            
            ))
        }
        .confirmationDialog("Are you sure?", isPresented: $showConfirmation) {
            Button("Proceed", role: .destructive) {
                controller.navigateToDestination()
            }
        }
        message: {
                Text("Do you want to proceed?")

        }
        
    }
}

struct TripFamilyPhotoViewUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let controller = TripFamilyPhotoViewController(viewModel: viewModel)
        TripFamilyPhotoViewUI(viewModel: viewModel, controller: controller)
    }
}
