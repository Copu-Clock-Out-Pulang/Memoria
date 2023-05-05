//
//  TripSelectAreaForm.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 04/05/23.
//

import SwiftUI

struct TripSelectAreaForm: View {
    let viewModel: DestinationViewModel
    let viewController: TripSelectAreaViewController
    @State var showedIndex: Int = 0

    var body: some View {
        let area = viewModel.areas
        let maxIndex = area.count - 1
        let isAreaEmpty = area.isEmpty
        GeometryReader { geo in
            ZStack(alignment: .top) {
                I.outputTest.swiftUIImage.resizable()
                    .frame(height: geo.size.height * 0.6)
                VStack(spacing: 20) {
                   
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 26)
                            .foregroundColor(I.textPrimary.swiftUIColor)
                            .onTapGesture {
                                if showedIndex > maxIndex {
                                    showedIndex = 0
                                }
                                else {
                                    showedIndex += 1
                                }
                                
                            }
                        Spacer()
                        Text(isAreaEmpty ? "Jakarta" : area[showedIndex].name)
                            .font(Font.custom("LilitaOne", size: 48))
                            .foregroundColor(I.textPrimary.swiftUIColor)
                        Spacer()
                        Image(systemName: "chevron.right")
                            
                            .resizable()
                            .scaledToFit()
                        
                            .frame(width: 18, height: 26)
                            .foregroundColor(I.textPrimary.swiftUIColor)
                            .onTapGesture {
                                if showedIndex == maxIndex {
                                    showedIndex = maxIndex
                                }
                                else {
                                    showedIndex -= 1
                                }
                            }
                    }
                    
                    .padding(.top, 40)
                    .padding(.horizontal, 40)
                    Text(isAreaEmpty ? "DKI Jakarta" : area[showedIndex].province)
                        .padding(.horizontal, 40)
                        .font(Font.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(I.textSecondary.swiftUIColor)

                    
                    Text(isAreaEmpty ? "The capital of republic of Indonesia" : area[showedIndex].description)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 40)
                        .font(Font.custom("Poppins-Light", size: 16))
                        .foregroundColor(I.textSecondary.swiftUIColor)

                    Spacer()
                    
                    Button {
                        if(!area.isEmpty) {
                            viewModel.selectArea(area: area[showedIndex])
                            //TODO: Add Dismiss view
                        }
                        
                    } label: {
                        Text("Select".uppercased())
                            .font(Font.custom("Poppins-Bold", size: 20))
                            .frame(maxWidth: .infinity, minHeight: 50)
                    }
                    .background(I.primaryButton.swiftUIColor)
                    .foregroundColor(.white)
                    
                    .clipShape(Capsule())
                    .shadow(radius: 2, y: 3)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 40)
                }
                .background(I.background.swiftUIColor)
                .padding(.top, geo.size.height * 0.6)
            }

        }
        .background(I.background.swiftUIColor)
        .ignoresSafeArea()

    }
}

struct TripSelectAreaForm_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let viewController = TripSelectAreaViewController(viewModel: viewModel)
        TripSelectAreaForm(viewModel: viewModel, viewController: viewController)
    }
}
