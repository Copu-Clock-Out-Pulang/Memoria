//
//  EditScrapBookDetailSheet.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 07/05/23.
//

import SwiftUI

struct EditScrapBookDetailSheet: View {
    @EnvironmentObject var controller: ScrapBookDetailViewController

    @Binding var name: String
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var quote: String
    @Binding var showSheet: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Name", text: $name)
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                }
                Section(header: Text("Quote")) {
                    TextField("Quote", text: $quote)
                }
            }
            .navigationBarTitle("Edit Scrap Book")
            .navigationBarItems(trailing:
                                    Button("Done") {
                                        controller.updateScrapBook(scrapBook: controller.getScrapBook(), tripName: name, tripDescription: quote, startDate: startDate, endDate: endDate)
                                        showSheet = false
                                        controller.viewDidLoad()
                                    }
            )
        }
    }
}
