//
//  TripQuoteForm.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 03/05/23.
//

import SwiftUI

struct TripQuoteForm: View {

    @State var quote: String = ""
    let viewModel: DestinationViewModel
    let controller: TripQuoteViewController
    var body: some View {
        ZStack {
            I.tripBackground3.swiftUIImage.resizable().scaledToFill()

            VStack(spacing: 20) {
                Text(S.dstEncourageYourSelf)
                    .font(Font.custom("LilitaOne", size: 40))
                    .multilineTextAlignment(.center
                    )
                    .foregroundColor(I.textPrimary.swiftUIColor)
                    .padding(.top, 180)
                Spacer()
                VStack {
                    TextField("Comment", text: $quote.max(40), prompt: Text(S.dstQuoteHint), axis: .vertical)
                        .lineLimit(3...5)
                        .autocorrectionDisabled(true)
                        .frame(height: 120)
                        .padding()
                        .font(Font.custom("Poppins", size: 16))
                        .background(.white)
                        .cornerRadius(30)
                        .shadow(radius: 2, y: 3)
                        .onChange(of: quote) {
                            viewModel.changeQuote(quote: $0)

                        }
                    HStack {
                        Text("(\(quote.count)/40)")
                            .font(Font.custom("Poppins-Light", size: 13))
                            .foregroundColor(I.textPrimary.swiftUIColor.opacity(0.60))
                        Spacer()
                    }.padding(.bottom, 96)
                    Button {
                        controller.navigateToTripArea()
                    } label: {
                        Text(S.dstNext)
                            .font(Font.custom("Poppins-Bold", size: 20))
                            .frame(maxWidth: .infinity, minHeight: 50)

                    }
                    .disabled(quote.isEmpty)
                    .background(quote.isEmpty ?
                                    I.disabledButton.swiftUIColor :
                                    I.primaryButton.swiftUIColor)
                    .foregroundColor(.white)

                    .clipShape(Capsule())
                    .shadow(radius: 2, y: 3)
                }
                .padding(.all, 20)
            }
            .padding(.all, 20)

        }
        .keyboardAware()
        .ignoresSafeArea()
    }
}


struct TripQuoteForm_Previews: PreviewProvider {

    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let controller = TripQuoteViewController(viewModel: viewModel)
        TripQuoteForm(viewModel: viewModel, controller: controller)
    }
}
