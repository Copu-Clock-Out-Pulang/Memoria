//
//  TripDateFormUI.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 03/05/23.
//

import SwiftUI

struct TripDateFormUI: View {
    @State private var dateRange: ClosedRange<Date>?
    @State private var formattedDates: String = ""
    @State private var showDialog = false

    let viewModel: DestinationViewModel
    let viewController: TripDateViewController
    

    var body: some View {
        ZStack {
            I.tripBackground2.swiftUIImage

            VStack(spacing: 20) {
                Spacer()
                Text(S.dstWhenDoYouWantToGo)
                    .font(Font.custom("LilitaOne", size: 40))
                    .multilineTextAlignment(.center
                    )
                    .foregroundColor(I.textPrimary.swiftUIColor)
                Spacer()
                Button {
                    
                }
            label: {
                if dateRange == nil || dateRange?.isEmpty == true {
                    Text(S.dstDateExample)
                        .font(Font.custom("Poppins", size: 20))
                        .frame(maxWidth: .infinity, minHeight: 50)
                } else {
                    Text(formattedDates)
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
            
                Button {
                    showDialog = true

                }
            label: {
                HStack {
                    Image(systemName: "calendar")
                    Text(S.dstPickADate)
                        .font(Font.custom("Poppins-Bold", size: 20))
                        
                }.frame(maxWidth: .infinity, minHeight: 50)
               
                }
            .background(I.secondaryButton.swiftUIColor)
            .foregroundColor(.white)
            
            .clipShape(Capsule())
            .shadow(radius: 2, y: 3)
            Spacer()
                if dateRange == nil || dateRange?.isEmpty == true {
                    Button {
                        viewController.navigateToQuoteView()
                    }
                    label: {
                        Text("Skip".uppercased())
                                .font(Font.custom("Poppins-Bold", size: 20))
                                .frame(maxWidth: .infinity, minHeight: 50)

                    }

                    .background(.white)
                    .cornerRadius(25)
                    .foregroundColor(I.primaryButton.swiftUIColor)
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(I.primaryButton.swiftUIColor, lineWidth: 3))

                    
                    .shadow(radius: 2, y: 3)
                } else {
                    Button {
                        viewController.navigateToQuoteView()
                    }
                    label: {
                            Text(S.dstNext)
                                .font(Font.custom("Poppins-Bold", size: 20))
                                .frame(maxWidth: .infinity, minHeight: 50)

                    }
                    .disabled(dateRange == nil)
                    .background(dateRange == nil ?
                                I.disabledButton.swiftUIColor :
                                I.primaryButton.swiftUIColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .shadow(radius: 2, y: 3)
                }
            
            }
            .padding(.all, 40)
            
        }
        .customDialog(isShowing: $showDialog) {
            SelectCalendarView(dateRange: $dateRange, showDialog: $showDialog)
            .onChange(of: self.dateRange) { dateRange in
                guard let range = dateRange else {
                    return
                }
                formatSelectedDates(dates: range)
                viewModel.changeStartEndDate(startDate: range.lowerBound, endDate: range.upperBound)
            }

        }
    }
    
    private func formatSelectedDates(dates: ClosedRange<Date>?) {
        guard let selected = dates else {
            formattedDates = ""
            return
        }
        let formatter = DateFormatter()

          formatter.dateFormat = "dd MMM"
        let startDate = formatter.string(from: selected.lowerBound)
        
        formatter.dateFormat = "dd MMM YY"
        let endDate = formatter.string(from: selected.upperBound)
          formattedDates = "\(startDate) - \(endDate)"
      }
}

struct TripDateFormUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let viewController = TripDateViewController(viewModel: viewModel)
        TripDateFormUI(viewModel: viewModel, viewController: viewController)
    }
}

struct SelectCalendarView: View {
    @Binding var dateRange: ClosedRange<Date>?
    @Binding var showDialog: Bool
    var body: some View {
        VStack {
            VStack {
                HStack {
                    if let range = dateRange {
                        Text("\(range)")
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .foregroundColor(I.textPrimary.swiftUIColor)
                            .padding()
                    } else {
                        Text(S.dstWhenDoYouWantToGo)
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .foregroundColor(I.textPrimary.swiftUIColor)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button {
                        showDialog = false
                    }
                label: {
                    Text("Done")
                        .font(Font.custom("Poppins-Bold", size: 16))
                        .foregroundColor(I.primaryButton.swiftUIColor)
                    }
                .padding()
                }
                
                MultiDatePicker(dateRange: self.$dateRange)
                    .padding()
                
            }
            .background(I.background.swiftUIColor)
            .cornerRadius(20)
        }
    }
}
