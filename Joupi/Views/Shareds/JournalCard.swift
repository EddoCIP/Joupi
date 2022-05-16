//
//  JournalCard.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalCard: View {
    var imageUrls : [String]
    var size: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size + (size/2))
            .foregroundColor(.red)
            .cornerRadius(25)
            .shadow(radius: 10)
            .overlay {
                VStack {
                    ImageJournal(imageUrls: imageUrls, size: size)
                    Text("Testing")
                        .font(.title)
                    Text("dari mana")
                        .font(.caption)
                }
            }
    }
}

struct ImageJournal: View {
    var imageUrls: [String] = []
    var size: CGFloat
    
    var body: some View {
        if imageUrls.count == 0 {
            Image("EmptyImage")
                .resizable()
                .frame(width: size * 0.9, height: size * 0.9)
        } else {
            ZStack {
                if imageUrls.count == 1 {
                    ImageCard(url: imageUrls[0])
                } else {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: size * 0.95, height: size * 0.95)
                        .rotationEffect(.degrees(5))
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: size * 0.8, height: size * 0.8)
                        .rotationEffect(.degrees(10))
                    ImageCard(url: imageUrls.first ?? "", size: size * 0.9)
                }
            }
        }
    }
}

struct JournalCard_Previews: PreviewProvider {
    static var previews: some View {
        JournalCard(imageUrls: ["", ""], size: 200.0)
    }
}
