//
//  ImageCarousel.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct ImageCarousel: View {
    @State var index: Int = 0
    
    var additionalTab: () -> Content
//    var views : [View] = []
    
//    init(v: View)
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(0..<3, id: \.self) { index in
                    ImageCard()
                }
                ImageCard()
                    .tabItem {
//                        Image(systemName: "2.square.fill")
//                        Text("Second")
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .frame(height: 200)
    }
}

struct ImageCard: View {
    var body: some View {
        Rectangle()
            .fill(Color.pink)
            .frame(height: 200)
            .border(Color.black)
            .padding()
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel()
    }
}
