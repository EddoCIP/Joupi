//
//  CameraView.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct CameraView: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var imageUrl: String = ""
    @State private var urls : [String] = []
    
    var body: some View {
        VStack {
            if urls.count != 0 {
                ImageCarousel(imageUrls: $urls)
            }
            Button("Open Camera") {
                self.showImagePicker = true
            }
            .padding()
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }.sheet(isPresented: self.$showImagePicker) {
            ImagePicker(isShown: $showImagePicker, imageUrls: $urls, pickerMode: 1)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
