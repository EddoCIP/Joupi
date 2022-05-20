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
        VStack {
            VStack(alignment: .leading) {
                Text(journal.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryAccentColor"))
                    .padding([.leading, .top])
                HStack {
                    Image(systemName: "cup.and.saucer")
                    VStack(alignment: .leading) {
                        Text(journal.location)
                            .font(.subheadline)
                            .foregroundColor(Color("PrimaryAccentColor"))
                        Text(formatDateToString(date:journal.createdDate, format: "dd MMM YYYY"))
                            .font(.caption)
                            .foregroundColor(Color("PrimaryAccentColor"))
                    }
                }
                .padding([.leading, .bottom])
                if journal.photoUrls.count > 0 {
                    Divider()
                    ImageJournal(imageUrls: journal.photoUrls)
//                    ImageCarousel(imageUrls: .constant(journal.photoUrls))
                }
            }
            .frame(width: self.size * 0.9, alignment: .leading)
        }
        .background(.white)
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        }
        .shadow(radius: 3)
    }
}

struct JournalCard_Previews: PreviewProvider {
    static var previews: some View {
        JournalCard(journal: JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, temperature: "", coffeeAmount: "", waterAmount: ""), size: UIScreen.main.bounds.width)
    }
}

struct ImageJournal: View {
    var imageUrls: [String] = []
//    var size: CGFloat
    
    var body: some View {
        if imageUrls.count == 0 {
            Image("EmptyImage")
                .resizable()
                .scaledToFill()
//                .frame(width: size * 0.8, height: size * 0.8)
        } else {
            ZStack {
                if imageUrls.count == 1 {
                    ImageCard(url: imageUrls[0])
                } else {
//                    ImageCard(url: imageUrls.first ?? "", width: size, height: size)
                    ImageCard(url: imageUrls.first ?? "")
                }
            }
        }
    }
}
