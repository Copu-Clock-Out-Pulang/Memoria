//
//  TripAreaForm.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 04/05/23.
//

import SwiftUI

struct TripAreaForm: View {
    @ObservedObject var viewModel: DestinationViewModel
    let viewController: TripAreaViewController
    var body: some View {
        GeometryReader { geo in
            ZStack {
                I.TripBackgrounds.tripBackground4.swiftUIImage
                    .resizable()
                    .scaledToFill()

                VStack(spacing: 20) {
                    Spacer()
                    
                    Text(S.dstWhereDoYouWantToGo)
                        .font(Font.custom("LilitaOne", size: 40))
                        .multilineTextAlignment(.center
                        )
                        .foregroundColor(I.textPrimary.swiftUIColor)
                    
                    Button {

                    }
                    label: {
                        if viewModel.selectedArea == nil {
                            Text("Select trip destination...")
                                .font(Font.custom("Poppins", size: 20))
                                .frame(maxWidth: .infinity, minHeight: 50)
                        } else {
                            Text(viewModel.selectedArea?.name ?? "")
                                .font(Font.custom("Poppins", size: 20))
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .foregroundColor(I.textPrimary.swiftUIColor)

                        }

                    }
                    .background(.white)
                    .foregroundColor(.black.opacity(0.35))
                    .clipShape(Capsule())
                    .shadow(radius: 2, y: 3)
                    .disabled(true)
                    .padding(.top, 100)

                    HStack {
                        Button {
                            viewController.navigateToSelectArea()
                        }
                        label: {
                            HStack {
                                Text("Select Place")
                                    .font(Font.custom("Poppins-Bold", size: 20))

                            }.frame(maxWidth: geo.size.width, minHeight: 50)

                        }
                        .background(I.secondaryButton.swiftUIColor)
                        .foregroundColor(.white)

                        .clipShape(Capsule())
                        .shadow(radius: 2, y: 3)

                        Button {
                            let random = Int.random(in: 0...(viewModel.areas.count - 1))
                            let randomArea = viewModel.areas[random]
                            viewModel.selectArea(area: randomArea)
                        }
                        label: {
                            HStack {
                                Image(systemName: "dice")

                            }.frame(maxWidth: geo.size.width * 0.18, minHeight: 50)

                        }
                        .background(.white)
                        .foregroundColor(I.secondaryButton.swiftUIColor)

                        .overlay(Circle().stroke(I.secondaryButton.swiftUIColor, lineWidth: 4))
                        .clipShape(Circle())
                        .shadow(radius: 2, y: 3)
                    }

                    Spacer()
                    
                    VStack {
                        Button {

                            viewController.navigateToUploadPhoto()
                        } label: {
                            Text(S.dstNext)
                                .font(Font.custom("Poppins-Bold", size: 20))
                                .frame(maxWidth: .infinity, minHeight: 50)

                        }
                        .disabled(viewModel.selectedArea == nil)
                        .background(viewModel.selectedArea == nil ?
                                        I.disabledButton.swiftUIColor :
                                        I.primaryButton.swiftUIColor)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .shadow(radius: 2, y: 3)

                        Image("Indicators/4")
                            .padding(.top, 25)
                    }

                }
                .padding(.all, 40)

            }
        }
        .ignoresSafeArea()

    }
}

struct TripAreaForm_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: DestinationViewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let viewController = TripAreaViewController(viewModel: viewModel)
        TripAreaForm(viewModel: viewModel, viewController: viewController)
    }
}
