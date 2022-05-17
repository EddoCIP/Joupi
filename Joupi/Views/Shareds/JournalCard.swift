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
            .frame(width: size, height: size * 1.5)
            .foregroundColor(Color("JournalCardBackground"))
            .cornerRadius(25)
            .shadow(radius: 10)
            .overlay {
                VStack {
                    ImageJournal(imageUrls: imageUrls, size: size)
                    Text("Testing")
                        .font(.title2)
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
                .frame(width: size * 0.8, height: size * 0.8)
        } else {
            ZStack {
                if imageUrls.count == 1 {
                    ImageCard(url: imageUrls[0])
                } else {
                    Rectangle()
                        .foregroundColor(Color("ImageStackBack"))
                        .frame(width: size * 0.8, height: size * 0.8)
                        .rotationEffect(.degrees(4), anchor: .bottomTrailing)
                    Rectangle()
                        .foregroundColor(Color("ImageStackMid"))
                        .frame(width: size * 0.8, height: size * 0.8)
                        .rotationEffect(.degrees(2), anchor: .bottomTrailing)
                    ImageCard(url: imageUrls.first ?? "", size: size * 0.8)
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
