//
//  CameraCaptureView.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import Foundation
import SwiftUI

struct CameraCaptureView: UIViewControllerRepresentable {
    @Binding var capturedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraCaptureView>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .camera
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraCaptureView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(capturedImage: $capturedImage, presentationMode: presentationMode)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var capturedImage: UIImage?
        var presentationMode: Binding<PresentationMode>
        
        init(capturedImage: Binding<UIImage?>, presentationMode: Binding<PresentationMode>) {
            _capturedImage = capturedImage
            self.presentationMode = presentationMode
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {
                return
            }
            
            capturedImage = image
            presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
