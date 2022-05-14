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
    @State private var imageUrl: String? = nil
    
    var body: some View {
        ScrollView {
            image?.resizable()
                .scaledToFit()
            Text(imageUrl ?? "")
            if imageUrl != "" && imageUrl != nil {
                let pngURL = URL(fileURLWithPath: imageUrl!)
                let data = try! Data(contentsOf: pngURL, options: [.mappedIfSafe, .uncached])
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Button("Open Camera") {
                self.showImagePicker = true
            }
            .padding()
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }.sheet(isPresented: self.$showImagePicker) {
            ImagePicker(isShown: $showImagePicker, image: $image, imageUrl: $imageUrl, pickerMode: 1)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
