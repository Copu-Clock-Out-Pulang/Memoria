//
//  KeyboardAwareModifier.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import SwiftUI

struct KeyboardAwareModifier: ViewModifier {

    @State private var keyboardHeight: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .edgesIgnoringSafeArea(keyboardHeight > 0 ? .bottom : [])
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    let frame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                    keyboardHeight = frame.height
                }

                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notification in
                    keyboardHeight = 0
                }
            }
    }
}

extension View {
    func keyboardAware() -> some View {
//        modifier(KeyboardAwareModifier())
        self.onTapGesture {
            // Hide the keyboard when the user taps outside of it
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
