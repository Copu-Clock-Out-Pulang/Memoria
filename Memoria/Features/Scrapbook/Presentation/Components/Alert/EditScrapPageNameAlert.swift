//
//  EditScrapPageNameAlert.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 07/05/23.
//

import SwiftUI

struct EditScrapPageNameAlert<Presenting>: View where Presenting: View {

    @Binding var isShowing: Bool
    @Binding var text: String
    let presenting: Presenting
    let title: String

    var body: some View {
        GeometryReader { (deviceSize: GeometryProxy) in
            ZStack {
                self.presenting
                    .disabled(isShowing)
                VStack {
                    Text(self.title)
                    TextField(self.title, text: self.$text)
                    Divider()
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.isShowing.toggle()
                            }
                        }) {
                            Text("Dismiss")
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .frame(
                    width: deviceSize.size.width * 0.7,
                    height: deviceSize.size.height * 0.7
                )
                .shadow(radius: 1)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }

}

// extension View {
//
//    func textFieldAlert(isShowing: Binding<Bool>,
//                        text: Binding<String>,
//                        title: String) -> some View {
//        EditScrapPageNameAlert(isShowing: isShowing,
//                       text: text,
//                       presenting: self,
//                       title: title)
//    }
//
// }
