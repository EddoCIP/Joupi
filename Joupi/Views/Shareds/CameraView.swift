//
//  CameraView.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct CameraView: View {
    @State private var showImagePicker: Bool = false
    @State private var urls : [String] = []
    @State private var image: Image? = nil
    @State private var url: String = ""
    @State private var showConfirmationDialog : Bool = false
    @State private var imagePickerMode = 0
    
    var body: some View {
        VStack {
            image?.resizable().frame(width: 200, height: 200)
            Text(url)
            if urls.count != 0 {
                ImageCarousel(imageUrls: $urls)
            }
            Button("Add Image") {
                self.showConfirmationDialog = true
            }
            .padding()
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }.sheet(isPresented: self.$showImagePicker) {
            ImagePicker(isShown: $showImagePicker, imageUrls: $urls, pickerMode: 1)
//            ImagePicker(isShown: $showImagePicker, image: $image, imageUrl: $url, imageUrls: $urls, pickerMode: imagePickerMode)
        }.confirmationDialog("Testing", isPresented: $showConfirmationDialog) {
            Button("Choose Photo") {
                self.showImagePicker = true
                self.imagePickerMode = 0
            }
            Button("Take Photo") {
                self.showImagePicker = true
                self.imagePickerMode = 1
            }
            Button("Cancel", role: .cancel) {
                
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
