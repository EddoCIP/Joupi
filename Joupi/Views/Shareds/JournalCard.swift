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
        //        ZStack {
        Rectangle()
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width)
            .fixedSize(horizontal: true, vertical: false)
            .cornerRadius(25)
            .shadow(radius: 10)
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Text(journal.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        HStack {
                            Image(systemName: "cup.and.saucer")
                            VStack(alignment: .leading) {
                                Text(journal.location)
                                    .font(.subheadline)
                                Text(formatDateToString(date:journal.createdDate, format: "dd/MM/YY"))
                                    .font(.caption)
                            }
                        }
                        if journal.photoUrls.count > 0 {
                            ImageJournal(imageUrls: journal.photoUrls, size: size)
                        }
                    }
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        //        }
        //        .fixedSize(horizontal: false, vertical: true)
        //        .clipShape(RoundedRectangle(cornerRadius: 25).stroke())
        //        .shadow(radius: 2)
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
