//
//  TripNameFormUI.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 03/05/23.
//

import SwiftUI

struct TripNameFormUI: View {
    @State var name: String = ""
    let viewModel: DestinationViewModel
    let viewController: TripNameViewController
    var body: some View {

        ZStack {
            I.TripBackgrounds.tripBackground1.swiftUIImage

            VStack(spacing: 100) {
                Spacer()
                Text(S.dstCreateYourTrip)
                    .font(Font.custom("LilitaOne", size: 40))
                    .foregroundColor(I.textPrimary.swiftUIColor)
                
                TextField(S.dstTripInputHint, text: $name)
                    .frame(height: 30)
                    .padding()
                    .font(Font.custom("Poppins", size: 16))
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 2, y: 3)
                    .onChange(of: name) {
                        viewModel.changeTripName(name: $0)
                    }
                
                Spacer()

                VStack {
                    Button {
                        viewController.navigateToDate()
                    } label: {
                        Text(S.dstNext)
                            .font(Font.custom("Poppins-Bold", size: 20))
                            .frame(maxWidth: .infinity, minHeight: 50)

                    }
                    .disabled(name.isEmpty)
                    .background(name.isEmpty ?
                                    I.disabledButton.swiftUIColor :
                                    I.primaryButton.swiftUIColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .shadow(radius: 2, y: 3)
                    
                    Image("Indicators/1")
                        .padding(.top, 25)
                }
                
            }
            .padding(.all, 40)

        }
        .ignoresSafeArea()
        .keyboardAware()


    }
}

struct TripNameFormUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewmodel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let viewController = TripNameViewController(viewModel: viewmodel)
        TripNameFormUI(viewModel: viewmodel, viewController: viewController)
    }
}
