//
//  JournalCard.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalCard: View {
    var imageUrls : [String] = ["", ""]
    let width: Int = 200
    let height: Int = 300
    
    var body: some View {
        Rectangle()
            .foregroundColor(.red)
            .cornerRadius(25)
            .shadow(radius: 10)
            .overlay {
                VStack {
//                    Image(systemName: "camera")
//                        .resizable()
//                        .frame(width: CGFloat(width * 90) / 100, height: CGFloat(width * 90) / 100)
                    ImageJournal(imageUrls: imageUrls)
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
    var body: some View {
        if imageUrls.count == 0 {
            Image(systemName: "camera")
                .resizable()
                .frame(width: 200, height: 200)
        } else {
            ZStack {
                if imageUrls.count == 1 {
//                    ImageCard(url: imageUrls[0], size: 200)
                } else {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(5))
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(10))
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .background(.yellow)
//                    ImageCard(url: imageUrls[0], size: 200)
                }
            }
        }
    }
}

struct JournalCard_Previews: PreviewProvider {
    static var previews: some View {
        JournalCard()
    }
}
