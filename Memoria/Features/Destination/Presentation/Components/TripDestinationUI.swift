//swiftlint:disable line_length
//  TripDestinationUI.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import SwiftUI

struct TripDestinationUI: View {
    @ObservedObject var viewModel: DestinationViewModel
    let viewController: TripDestinationViewController
    
        let rows = [
            GridItem(.fixed(5), spacing: 250),
            GridItem(.fixed(5), spacing: 250),
        ]
    var body: some View {
        
        let jakarta = Area(id: UUID(), name: "Jakarta", province: "DKI Jakarta", description: "The Capital of Republic Indonesia", image: "Jakarta")
        
        let destination = Destination(id: UUID(), area: jakarta, name: "Ragunan", description: "Ragunan Zoo or Taman Margasatwa Ragunan is more than 150 years old, and was the first zoo in Indonesia. Its name is familiar to the Indonesian people, and it is a favorite location for holding various school activities or reunions. Because the location is very wide, besides that the entrance fee is very cheap. The atmosphere at Ragunan Zoo is shady, because of the many trees.", photo: "Ragunan", address: "Harsono RM. Street Number 1, Ragunan, Pasar Minggu, South Jakarta 12550 Indonesia", coordinate: Coordinate(latitude: -6.301752, longitude: 106.820788), ticketPrice: "Rp. 3.000 - Rp. 4.000", webstite: "https://ragunanzoo.jakarta.go.id/language/id/", instagram: "https://www.instagram.com/ragunanzoo/?hl=en")
            ZStack {
                I.TripBackgrounds.tripBackground6.swiftUIImage
                    .resizable()
                    .scaledToFill()
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Rectangle()
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                            .foregroundColor(I.backgroundOverlay.swiftUIColor
                                .opacity(0.9)
                            )
//                            .mask(RoundedRectangle(cornerRadius: 30))
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.73)
                            .shadow(radius: 5)
                    }
                    
                }
                GeometryReader { geo in
                    VStack {
                        Text(S.dstChooseYourDestination.uppercased())
                            .font(Font.custom("LilitaOne", size: 40))
                            .multilineTextAlignment(.center
                            )
                            .foregroundColor(I.textPrimary.swiftUIColor)
                            .padding(.top, geo.size.height * 0.12)
                    }
                    
                }
                .padding()
                
                GeometryReader { geo in
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, spacing: 40) {
                            ForEach(Array(viewModel.recommendations.enumerated()),id: \.element.id ) { index, element in
                                
                                if (index % 2 == 0) {
                                    RightDestinationCard(recommendation: element) {
                                        viewModel.selectRecommendation(recommendation: element)
                                    }
                                    .rotationEffect(Angle(degrees: 10))
                                    .padding()
                                    
                                }
                                else {
                                    LeftDestinationCard(recommendation: element) {
                                        viewModel.selectRecommendation(recommendation: element)
                                    }
                                    .rotationEffect(Angle(degrees: -10))
                                                                       .padding()
                                }
                            }
                        }
                    }
                    .padding(.top, 255)
                    
                }
                
            }
            .ignoresSafeArea()
    }
}

struct TripDestinationUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        
        let controller = TripDestinationViewController(viewModel: viewModel)
        TripDestinationUI(viewModel: viewModel, viewController: controller)
    }
}
