//
//  ImageCarousel.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct ImageCarousel: View {
    @State var index: Int = 0
    
    @Binding var imageUrls: [String]
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                if (imageUrls.count > 0) {
                    ForEach(Array(zip(imageUrls.indices, imageUrls)), id: \.0) { index, url in
                        ImageCard(url: url)
                    }
                } else {
                    Image("EmptyImage")
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .frame(height: 200)
    }
}

struct ImageCard: View {
    var url: String
    var size: CGFloat = 200
    
    var body: some View {
        let pngURL = URL(fileURLWithPath: url)
        //        let data = try! Data(contentsOf: pngURL, options: [.mappedIfSafe, .uncached])
        if let data = try? Data(contentsOf: pngURL, options: [.mappedIfSafe, .uncached]) {
            Image(uiImage: UIImage(data: data)!)
                .resizable()
                .frame(width: size, height: size)
        } else {
            Image("EmptyImage")
                .resizable()
                .frame(width: size, height: size)
        }
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel(imageUrls: .constant([]))
        ImageCard(url: "")
    }
}
