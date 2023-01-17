//
//  ProfileImagePicker.swift
//  SSS
//
//  Created by 서재혁 on 2023/01/17.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    
    @Binding var showPicker : Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init (_ picker: ImagePicker) {
        self.parent = picker
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Run code when the user has selected an image
        
        print("Image selected")
        
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            //We were able to get the image
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
  
        }
        // Dismiss Picker
        parent.showPicker = false
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Run Code when the user has cancelled the picker UI
        
        print("Cancelled")
        
        // Dismiss Picker
        parent.showPicker = false
    }
    
}
