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
    @State var show = false
    @State var selectedDestination: Recommendation?

    let rows = [
        GridItem(.fixed(5), spacing: 250),
        GridItem(.fixed(5), spacing: 250)
    ]
    var body: some View {
        var pressedIndex: Int = -1
        
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
                        ForEach(Array(viewModel.recommendations.enumerated()), id: \.element.id ) { index, element in
                            
                            if index.isMultiple(of: 2) {
                                RightDestinationCard(recommendation: element) {
                                    viewModel.selectRecommendation(recommendation: element)
                                }
                                .rotationEffect(Angle(degrees: 10))
                                .padding()
                                .onLongPressGesture {
                                    let generator = UINotificationFeedbackGenerator()
                                       generator.notificationOccurred(.success)
                                    print(index)
                                    selectedDestination = element
                                    pressedIndex = index
                                    print(pressedIndex)
                                    show.toggle()
                                }
                            } else {
                                LeftDestinationCard(recommendation: element) {
                                    viewModel.selectRecommendation(recommendation: element)
                                }
                                .rotationEffect(Angle(degrees: -10))
                                .padding()
                                .onLongPressGesture {
                                    let generator = UINotificationFeedbackGenerator()
                                       generator.notificationOccurred(.success)
                                    print(index)
                                    selectedDestination = element
                                    pressedIndex = index
                                    print(pressedIndex)
                                    show.toggle()
                                }
                            }
                        }
                    }
                }
                .padding(.top, 255)
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $show) {
            if pressedIndex > -1 {
                DestinationDetail(destination: viewModel.recommendations[pressedIndex].destination)
            }
        }
        .onReceive(viewModel.$createdScrapBook) { _ in
            if viewModel.createdScrapBook != nil {
                viewController.navigateToScrapBookDetail()
            }
        }
    }
}

struct TripDestinationUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        
        let controller = TripDestinationViewController(viewModel: viewModel)
        TripDestinationUI(viewModel: viewModel, viewController: controller)
    }
}
