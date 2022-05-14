//
//  ImageCarousel.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct ImageCarousel: View {
    @State var index: Int = 0
    @State var isShowCamera: Bool = false
    @State var image: Image?
    
    var items: [Any] = [ImageCard.self, ImageCard.self, ImageCard.self, AddImageCard.self]
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(0..<items.count) { index in
                    self.buildView(types: self.items, index: index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .frame(height: 200)
    }
    
    func buildView(types: [Any], index: Int) -> AnyView {
        switch types[index].self {
        case is ImageCard.Type: return AnyView( ImageCard() )
        case is AddImageCard.Type: return AnyView( AddImageCard() )
        default: return AnyView(EmptyView())
        }
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

struct AddImageCard: View {
    var body: some View {
        Rectangle()
            .frame(height: 200)
            .border(Color.black)
            .overlay(content: {
                Image(systemName: "camera")
            })
            .padding()
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel()
    }
}
