//
//  JournalDetail.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalDetail: View {
    
//    @Binding var journalList: [JournalModel]
//    @State var journalTitle: String = ""
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {

        VStack {
            CupOfCoffeeDetail(journalVM: journalVM).padding()
            CoffeePicDetail(journalVM: journalVM)
            BeanListDetail(journalVM: journalVM).padding()
            MemoDetails(journalVM: journalVM).padding()
            
            Spacer()
        }
    }
}

struct CupOfCoffeeDetail: View {
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {

        VStack {
            HStack {
                Text(journalVM.selectedJournal.name)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                Spacer()
            }
            HStack{
                Image(systemName: "cup.and.saucer")
                Text(journalVM.selectedJournal.location)
                Spacer()
            }
        }
    }
}

struct CoffeePicDetail: View {
    
//    @Binding var journalList: [JournalModel]
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {
        ImageCarousel(imageUrls: .constant(journalVM.selectedJournal.photoUrls))
    }
}

struct BeanListDetail: View {
    @ObservedObject var journalVM: JournalViewModel

    var body: some View {
        VStack {
            HStack {
                Text ("Method")
                Spacer()
                Text (journalVM.selectedJournal.method)
            }.underlineTextField()
            HStack {
                Text ("Beans Region")
                Spacer()
                Text (journalVM.selectedJournal.coffeeOrigin)
            }.underlineTextField()
            HStack {
                Text ("Variety")
                Spacer()
                Text (journalVM.selectedJournal.variety)
            }.underlineTextField()
            HStack {
                Text ("Process")
                Spacer()
                Text (journalVM.selectedJournal.process)
            }.underlineTextField()
            HStack {
                Text ("Roast Date")
                Spacer()
                Text (formatDateToString(date: journalVM.selectedJournal.roastDate, format: "MMMM, dd YYYY"))
            }.underlineTextField()
            HStack {
                Text ("Coffee Amount")
                Spacer()
                    Text (journalVM.selectedJournal.coffeeAmount)
            }.underlineTextField()
            HStack {
                Text ("Water Amount")
                Spacer()
                    Text (journalVM.selectedJournal.waterAmount)
            }.underlineTextField()
            HStack {
                Text ("Temperature")
                Spacer()
                    Text (journalVM.selectedJournal.temperature)
            }.underlineTextField()
        }
    }
}

struct MemoDetails: View {
    
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {
        VStack {
            HStack{
                Text(journalVM.selectedJournal.memo)
                    Spacer()
            }
            Divider()
                .frame(height: 1)
                .background(.gray)
        }
        
    }
}

struct JournalDetail_Previews: PreviewProvider {
    static var previews: some View {
        JournalDetail(journalVM: JournalViewModel())
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
