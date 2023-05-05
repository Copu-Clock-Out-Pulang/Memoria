//
//  ScrapBookCarousel.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapBookCarousel: View {
    @State var selectedCard: Int = 0
    @GestureState var isLongPress = false
    private let cardSpacing: CGFloat = 10
    
    let cards = [
        AnyView(ScrapPageCreateButton()),
        AnyView(ScrapBookCarouselCard(scrapPageName: "Trip 1", scrapPageThumbnail: "ScrapPageThumbNailDummy")),
        AnyView(ScrapBookCarouselCard(scrapPageName: "Trip 2", scrapPageThumbnail: "ScrapPageThumbNailDummy")),
        AnyView(ScrapBookCarouselCard(scrapPageName: "Trip 3", scrapPageThumbnail: "ScrapPageThumbNailDummy")),
        AnyView(ScrapBookCarouselCard(scrapPageName: "Trip 4", scrapPageThumbnail: "ScrapPageThumbNailDummy")),
        AnyView(ScrapBookCarouselCard(scrapPageName: "Trip 5", scrapPageThumbnail: "ScrapPageThumbNailDummy"))
        
    ] as [AnyView]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: self.cardSpacing) {
                    ForEach(0..<self.cards.count, id: \.self) { index in
                        cards[index]
                            .frame(
                                width: geometry.size.width * 0.464,
                                height: geometry.size.height * 0.294
                            )
                            .scaleEffect(self.selectedCard == index ? 1.15 : 1.0)
                            .animation(.easeOut(duration: 0.2))
                            .onTapGesture {
                                withAnimation {
                                    self.selectedCard = index
                                }
                            }
                    }.gesture(
                        DragGesture()
                            .onEnded {
                            value in
                                let offset = value.translation.width
                                let newIndex = (CGFloat(selectedCard) * geometry.size.width - offset)/geometry.size.width
                            withAnimation {
                                selectedCard = max(0, min(Int(newIndex), cards.count - 1 ))
                            }
                        }
                    )
                    }.frame(
                        maxHeight: geometry.size.height * 0.5
                    )
                }
                .frame(
                    maxWidth: geometry.size.width
                )
                .padding(.horizontal, self.cardSpacing)
            }
        }
    }
}
