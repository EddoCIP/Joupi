//
//  JournalDetail.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalDetail: View {
    
    @Binding var journalList: [JournalModel]
    @State var journalTitle: String = ""
    
    var body: some View {

        VStack {
            CupOfCoffeeDetail().padding()
            BeanListDetail().padding()
            MemoDetails().padding()
            Spacer()
        }
    }
}

struct CupOfCoffeeDetail: View {
    
    var body: some View {

        VStack {
            HStack {
                Text("Manual Brew, Japanese Style")
                    .multilineTextAlignment(.leading)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack{
                Image(systemName: "cup.and.saucer")
                Text("Baba Coffee @ Ciputat")
                Spacer()
            }
        }
    }
}

struct CoffeePicDetail: View {
    
    @Binding var journalList: [JournalModel]
    
    var body: some View {
        ImageCarousel(imageUrls: $journalList[0].photoUrls)
    }
}

struct BeanListDetail: View {

    var body: some View {
        VStack {
            HStack {
                Text ("Method")
                Spacer()
                Text ("v60")
            }.underlineTextField()
            HStack {
                Text ("Beans Region")
                Spacer()
                Text ("Aceh Gayo")
            }.underlineTextField()
            HStack {
                Text ("Variety")
                Spacer()
                Text ("Sigararutang")
            }.underlineTextField()
            HStack {
                Text ("Process")
                Spacer()
                Text ("Sigararutang")
            }.underlineTextField()
            HStack {
                Text ("Roast Date")
                Spacer()
                Text ("May 20, 2022")
            }.underlineTextField()
            HStack {
                Text ("Coffee Amount")
                Spacer()
                Text ("15 g")
            }.underlineTextField()
            HStack {
                Text ("Water Amount")
                Spacer()
                Text ("225 ml/g")
            }.underlineTextField()
            HStack {
                Text ("Temperatur")
                Spacer()
                Text ("89 C")
            }.underlineTextField()
        }
    }
}

struct MemoDetails: View {
    
    var body: some View {
            HStack{
                Text("Biji kopi ini agak susah didapat sadasdsad")
                Spacer()
            }.underlineTextField()
    }
}

struct JournalDetail_Previews: PreviewProvider {
    static var previews: some View {
        JournalDetail(journalList: .constant([JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1)]), journalTitle: "")
    }
}


extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}
extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 7)
            .overlay(Rectangle().frame(height: 1).padding(.top, 30))
            .foregroundColor(.gray)
            .padding(0)
    }
}
