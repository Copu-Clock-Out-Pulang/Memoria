//
//  ScrapBookCarousel.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 04/05/23.
//

import SwiftUI

struct ScrapBookCarousel: View {
    @EnvironmentObject var controller: ScrapBookDetailViewController
    @EnvironmentObject var scrapPageViewModel: ScrapPageViewModel
    @State var selectedCard: Int = 0
    @GestureState var isLongPress = false
    private let cardSpacing: CGFloat = 10

    var scrapPages: [ScrapPage]

    @State var cards = [
        AnyView(ScrapPageCreateButton())
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
                                        print(index)
                                        if index != 0 {
                                            scrapPageViewModel.setScrapPage(scrapPage: scrapPages[index - 1])
//                                            controller.index = index - 1
                                        } else {
//                                            controller.index = 0
                                        }
//                                        print(scrapPages[index - 1])
                                    }
                                }
                        }
                    }.gesture(
                        DragGesture()
                            .onEnded {
                                value in
                                let offset = value.translation.width
                                let newIndex = (CGFloat(selectedCard) * geometry.size.width - offset) / geometry.size.width
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
            .onAppear {
                let pagesView = scrapPages.map { page in
                    AnyView(ScrapBookCarouselCard(scrapPageName: page.name, scrapPageThumbnail: page.thumbnail, scrapPageContent: page.content))
                }
                cards.append(contentsOf: pagesView)
            }
        }
    }
}
