//swiftlint:disable line_length
//  DestinationDetail.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 07/05/23.
//

import SwiftUI
import MapKit

struct DestinationDetail: View {

    @Environment(\.dismiss) var dismiss
    let destination: Destination
    @State private var region: MKCoordinateRegion = {
            var mapCoordinate = CLLocationCoordinate2D.init(latitude: -6.175392, longitude: 16.43)
        var mapZoomLevel = MKCoordinateSpan.init(latitudeDelta: 0.03, longitudeDelta: 0.03)
            var mapRegion = MKCoordinateRegion.init(center: mapCoordinate, span: mapZoomLevel)
            return mapRegion
        }()
    @State var locations: [Coordinate] = []
    
    var body: some View {
        ZStack {
            I.TripBackgrounds.tripBackground6
                .swiftUIImage
                .resizable()
                .scaledToFill()
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))

            VStack {
                Button {
                    dismiss()
                }
                label: {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .opacity(0.7)
    
            }
            .frame(width: 40, height: 40)
            .padding(.top, 90)
            .padding(.leading, 280)
            Spacer()
            }
            
            
            GeometryReader { geo in
                VStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(I.background.swiftUIColor)
                        .frame(height: geo.size.height * 0.6)
                        .cornerRadius(80, corners: [.topLeft, .topRight])
                }
             
            
            }
           
            VStack {
                Spacer()
                ZStack {
                    Image(destination.photo)
                        .resizable()
                        .frame(width: 185, height: 300)
                        .clipped()
                        .cornerRadius(40)
                    I.treeLeft.swiftUIImage
                        .resizable()
                        .frame(width: 110, height: 130)
                        .padding(.trailing, 220)
                        .padding(.top, 180)
                    I.treeRight.swiftUIImage
                        .resizable()
                        .frame(width: 110, height: 130)
                        .padding(.leading, 220)
                        .padding(.top, 180)
                }
                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        Text(destination.name)
                            .font(Font.custom("LilitaOne", size: 24))
                            .foregroundColor(I.textPrimary.swiftUIColor)
                            .padding(.top, 20)
                        
                        Text(destination.description)
                            .font(Font.custom("Poppins-Medium", size: 14))
                            .foregroundColor(I.textPrimary.swiftUIColor)
                        
                        HStack {
                            ZStack {
                                Text("Price")
                                    .font(Font.custom("Poppins-Medium", size: 14))
                                    .foregroundColor(I.background.swiftUIColor)
                                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                                   
                            }                                    .background(I.textPrimary.swiftUIColor)
                                .clipShape(Capsule())

                           
                            Spacer()
                            Text(destination.ticketPrice ??
                            "Free")
                                .font(Font.custom("Poppins-Medium", size: 14))
                                .foregroundColor(I.textPrimary.swiftUIColor)
                        }
                        
                        Map(coordinateRegion: $region, showsUserLocation: false, annotationItems: locations) { item in
                            MapMarker(coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude))
                                    
                            }
                            .frame(width: 250, height: 130)
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .strokeBorder(I.textPrimary.swiftUIColor, lineWidth: 2)

                            }
                            .cornerRadius(30)
                        
                        HStack {
                            Text("For more info:")
                                .font(Font.custom("Poppins-Medium", size: 14))
                                .foregroundColor(I.textPrimary.swiftUIColor)
                            Spacer()
                        }
                        
                        HStack {
                            Link(destination: URL(string: destination.webstite ?? "https://www.google.com")!) {
                                Image(systemName: "globe")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(I.textPrimary.swiftUIColor)
                            }
                            
                            Link(destination: URL(string: destination.instagram ?? "https://www.apple.com")!) {
                                I.instagram.swiftUIImage
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            
                          
                            Spacer()
                        }
                        .padding(.bottom, 40)
                        

                    }
                    
                }.frame(
                height: 400)
//                .background(.black)
               
            }
            .padding(.horizontal, 40)
            
         
            
            I.treeStraight.swiftUIImage
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.leading, 300)
            I.treeStraight.swiftUIImage
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.trailing, 300)
        }
        .ignoresSafeArea()
        .onAppear {
            region = {
                let mapCoordinate = CLLocationCoordinate2D.init(latitude: destination.coordinate.latitude, longitude: destination.coordinate.longitude)
                let mapZoomLevel = MKCoordinateSpan.init(latitudeDelta: 0.03, longitudeDelta: 0.03)
                let mapRegion = MKCoordinateRegion.init(center: mapCoordinate, span: mapZoomLevel)
                return mapRegion
            }()
            
            locations = [
                destination.coordinate
            ]
        }
    }
}

struct DestinationDetail_Previews: PreviewProvider {
    static var previews: some View {
        let jakarta = Area(id: UUID(), name: "Jakarta", province: "DKI Jakarta", description: "The Capital of Republic Indonesia", image: "Jakarta")
   
           let destination = Destination(id: UUID(), area: jakarta, name: "Ragunan", description: "Ragunan Zoo or Taman Margasatwa Ragunan is more than 150 years old, and was the first zoo in Indonesia. Its name is familiar to the Indonesian people, and it is a favorite location for holding various school activities or reunions. Because the location is very wide, besides that the entrance fee is very cheap. The atmosphere at Ragunan Zoo is shady, because of the many trees.", photo: "Ragunan", address: "Harsono RM. Street Number 1, Ragunan, Pasar Minggu, South Jakarta 12550 Indonesia", coordinate: Coordinate(latitude: -6.301752, longitude: 106.820788), ticketPrice: "Rp. 3.000 - Rp. 4.000", webstite: "https://ragunanzoo.jakarta.go.id/language/id/", instagram: "https://www.instagram.com/ragunanzoo/?hl=en")
        DestinationDetail(destination: destination)
    }
}
