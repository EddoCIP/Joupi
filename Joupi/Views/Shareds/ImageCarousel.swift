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
                ForEach($imageUrls, id: \.self) { $url in
                    ImageCard(url: url)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .frame(height: 200)
    }
}

struct ImageCard: View {
    var url: String
    
    var body: some View {
        let pngURL = URL(fileURLWithPath: url)
        let data = try! Data(contentsOf: pngURL, options: [.mappedIfSafe, .uncached])
        Image(uiImage: UIImage(data: data)!)
            .resizable()
            .frame(width: 200, height: 200)
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel(imageUrls: .constant([]))
    }
}
