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
            .frame(height: .leastNormalMagnitude)
        }
    }
}

struct ImageCard: View {
    var url: String
    
    var body: some View {
        let pngURL = URL(fileURLWithPath: url)
        if let data = try? Data(contentsOf: pngURL, options: [.mappedIfSafe, .uncached]) {
            Image(uiImage: UIImage(data: data)!)
                .resizable()
                .scaledToFit()
            //                .scaledToFill()
        } else {
            Image("EmptyImage")
                .resizable()
        }
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel(imageUrls: .constant([]))
    }
}
