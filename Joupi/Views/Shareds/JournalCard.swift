//
//  JournalCard.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalCard: View {
    var journal: JournalModel
    var size: CGFloat
    
    var body: some View {
        HStack {
            ImageJournal(imageUrls: journal.photoUrls, size: size)
            VStack(alignment: .leading) {
                Text(journal.coffeeName)
                    .font(.title2)
                Text(journal.location)
                    .font(.caption)
                Text(formatDateToString(date: journal.createdDate, format: "dd-MMMM-YYYY"))
                    .font(.caption2)
            }
        }
    }
}

struct JournalCard_Previews: PreviewProvider {
    static var previews: some View {
        JournalCard(journal: JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1), size: 100)
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
                    ImageCard(url: imageUrls.first ?? "", width: size * 0.8, height: size * 0.8)
                }
            }
        }
    }
}
