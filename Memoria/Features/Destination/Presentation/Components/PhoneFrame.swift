//
//  PhoneFrame.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import SwiftUI

struct PhoneFrame: View {
    let image: Image
    var body: some View {
        ZStack {
            I.phoneFrame.swiftUIImage
                .resizable()
                .frame(maxWidth: 500, maxHeight: 210)
                .padding()
            VStack {
                image
                    .resizable()
                    .frame(
                        maxWidth: 150,
                        maxHeight: 124
                    )
                    .padding(.leading, 20)
                    .padding(.bottom, 6)
            }
            .padding()
        }
    }
}

struct PhoneFrame_Previews: PreviewProvider {
    static var previews: some View {
        PhoneFrame(image: I.imageTest.swiftUIImage)
    }
}
