// swiftlint:disable line_length
//  RightDestinationCard.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import SwiftUI

struct RightDestinationCard: View {
    @State var isChecked = false
    
    let recommendation: Recommendation
    var onTap: () -> Void
    var body: some View {
        ZStack {
            
            Image(uiImage:recommendation.generatedPhoto)
                .resizable()
                    .frame(width: 280, height: 210)
                    .cornerRadius(30)
            
            ZStack {
                Rectangle()
                    .frame(width: 180, height: 53)
                    .foregroundColor(I.primaryButton.swiftUIColor)
                Text(recommendation.destination.name)
                    .font(Font.custom("LilitaOne", size: 32))
                    .foregroundColor(I.textOnButton.swiftUIColor)
                    .frame(width: 180, height: 53)

            }
            .padding(.bottom, 250)
            .padding(.leading, 90)
            .rotationEffect(Angle(degrees: 8))
            
            ZStack {
                Rectangle()
                    .frame(width: 140, height: 35)
                    .foregroundColor(I.accentButton.swiftUIColor)
                Text(recommendation.destination.area.name)
                    .font(Font.custom("LilitaOne", size: 20))
                    .foregroundColor(I.textOnButton.swiftUIColor)
                    .frame(width: 140, height: 35)

            }
            .padding(.bottom, 170)
            .padding(.leading, 90)
            .rotationEffect(Angle(degrees: 8))
            
            
            if !isChecked {
                I.unchecked.swiftUIImage.resizable()
                    .frame(width: 30, height: 30)
                    .padding(.bottom, 150)
                    .padding(.trailing, 200)
            }
            else {
                I.checked.swiftUIImage.resizable()
                    .frame(width: 30, height: 30)
                    .padding(.bottom, 150)
                    .padding(.trailing, 200)
            }

        }.onTapGesture {
            isChecked.toggle()
            onTap()
        }
    }
}

//struct RightDestinationCard_Previews: PreviewProvider {
//    static var previews: some View {
//        let jakarta = Area(id: UUID(), name: "Jakarta", province: "DKI Jakarta", description: "The Capital of Republic Indonesia", image: "Jakarta")
//        
//        let destination = Destination(id: UUID(), area: jakarta, name: "Ragunan", description: "Ragunan Zoo or Taman Margasatwa Ragunan is more than 150 years old, and was the first zoo in Indonesia. Its name is familiar to the Indonesian people, and it is a favorite location for holding various school activities or reunions. Because the location is very wide, besides that the entrance fee is very cheap. The atmosphere at Ragunan Zoo is shady, because of the many trees.", photo: "Ragunan", address: "Harsono RM. Street Number 1, Ragunan, Pasar Minggu, South Jakarta 12550 Indonesia", coordinate: Coordinate(latitude: -6.301752, longitude: 106.820788), ticketPrice: "Rp. 3.000 - Rp. 4.000", webstite: "https://ragunanzoo.jakarta.go.id/language/id/", instagram: "https://www.instagram.com/ragunanzoo/?hl=en")
//        RightDestinationCard(destination: destination) {
//            print("checked")
//        }
//    }
//}
