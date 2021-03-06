//
//  ImagePicker.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 14/05/22.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isShown: Bool
//    @Binding var image: Image?
//    @Binding var imageUrl: String
    @Binding var imageUrls: [String]
    
//    init(isShown: Binding<Bool>, image: Binding<Image?>, imageUrl: Binding<String>, imageUrls: Binding<[String]>) {
//        _isShown = isShown
//        _image = image
//        _imageUrl = imageUrl
//        _imageUrls = imageUrls
//    }
    init(isShown: Binding<Bool>, imageUrls: Binding<[String]>) {
        _isShown = isShown
        _imageUrls = imageUrls
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // ini harus pake save image to directory
        // Obtaining the Location of the Documents Directory
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileName = "\(formatDateToString(date: Date.now, format: "YYYY-MM-DD-HH:mm:ss.SSSS")).png"

        // Create URL
        let url = documents.appendingPathComponent(fileName)
        // Convert to Data
        if let data = uiImage.jpegData(compressionQuality: 1) {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write Image Data to Disk")
            }
        }
//        image = Image(uiImage: uiImage)
        isShown = false
//        imageUrl = url.path
        imageUrls.append(url.path)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
//    @Binding var image: Image?
//    @Binding var imageUrl: String
    @Binding var imageUrls: [String]
    
    var pickerMode: Int = 0 // 0 -> album, 1 -> camera
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
//        return ImagePickerCoordinator(isShown: $isShown, image: $image, imageUrl: $imageUrl, imageUrls: $imageUrls)
        return ImagePickerCoordinator(isShown: $isShown, imageUrls: $imageUrls)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        // if preview, show gallery view instead of camera view
        if pickerMode == 1 {
            picker.sourceType = .camera
        }
        return picker
    }
}
