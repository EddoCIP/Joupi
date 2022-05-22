//
//  JournalDetail.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalDetail: View {
    @ObservedObject var journalVM: JournalViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isShowConfirmation: Bool = false
    @State private var isShowEditPage: Bool = false
    @State private var isShowAlert: Bool = false
    
    var body: some View {
        ScrollView {
            CupOfCoffeeDetail(journalVM: journalVM).padding()
            CoffeePicDetail(journalVM: journalVM)
            BeanListDetail(journalVM: journalVM).padding()
            MemoDetails(journalVM: journalVM).padding()
            ExperienceMemo(journalVM: journalVM).padding()
            Spacer()
        }
        .frame(minWidth: UIScreen.main.bounds.width * 0.9)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowConfirmation.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
        .navigationTitle("Journal Detail")
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
        .confirmationDialog("Testing", isPresented: $isShowConfirmation) {
            Button("Edit Journal") {
                isShowEditPage.toggle()
            }
            Button("Delete Journal", role: .destructive) {
                isShowAlert.toggle()
            }
            Button("Cancel", role: .cancel) {
                
            }
        }
        .background(
            NavigationLink("", isActive: $isShowEditPage) {
                JournalForm(journalVM: journalVM, action: .edit)
            }
        )
        .alert(isPresented: $isShowAlert) {
            return Alert(title: Text("Are you sure want to delete this journal?"), message: Text("This journal will be deleted permanently"), primaryButton: .cancel(), secondaryButton: .destructive(
                Text("Delete"),
                action: {
                    journalVM.deleteJournal()
                    self.presentationMode.wrappedValue.dismiss()
                }))
            
            
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
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {
        if journalVM.selectedJournal.photoUrls.count > 0 {
            ImageCarousel(imageUrls: .constant(journalVM.selectedJournal.photoUrls))
                .frame(minWidth: UIScreen.main.bounds.width * 0.9, minHeight: 200)
        }
    }
}

struct BeanListDetail: View {
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {
        VStack {
            
            if journalVM.selectedJournal.coffeeOrigin != "" {
                VStack {
                    HStack {
                        Text ("Beans Origin")
                        Spacer()
                        Text (journalVM.selectedJournal.coffeeOrigin)
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
            
            if formatDateToString(date: journalVM.selectedJournal.roastDate, format: "MMMM, dd YYYY") != formatDateToString(date: Date.now, format: "MMMM, dd YYYY") {
                VStack {
                    HStack {
                        Text ("Roast Date")
                        Spacer()
                        Text (formatDateToString(date: journalVM.selectedJournal.roastDate, format: "MMMM, dd YYYY"))
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
            
            //            if journalVM.selectedJournal.variety != "" {
            //                VStack {
            //                    HStack {
            //                        Text ("Variety")
            //                        Spacer()
            //                        Text (journalVM.selectedJournal.variety)
            //                    }
            //                    Divider()
            //                        .frame(height: 1)
            //                        .background(.gray)
            //                }
            //            }
            
            if journalVM.selectedJournal.process != "" && journalVM.selectedJournal.process != processList.first ?? "" {
                VStack {
                    HStack {
                        Text ("Process")
                        Spacer()
                        Text (journalVM.selectedJournal.process)
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
            
            if journalVM.selectedJournal.method != "" && journalVM.selectedJournal.method != Method.first ?? "" {
                VStack {
                    HStack {
                        Text ("Method")
                        Spacer()
                        Text (journalVM.selectedJournal.method)
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
            
            if journalVM.selectedJournal.temperature != "" {
                VStack {
                    HStack {
                        Text ("Temperature")
                        Spacer()
                        Text (journalVM.selectedJournal.temperature)
                        Text("°C")
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
            
            if journalVM.selectedJournal.coffeeAmount != "" {
                VStack {
                    HStack {
                        Text ("Coffee Amount")
                        Spacer()
                        Text (journalVM.selectedJournal.coffeeAmount)
                        Text("gr")
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
            if journalVM.selectedJournal.waterAmount != "" {
                VStack {
                    HStack {
                        Text ("Water Amount")
                        Spacer()
                        Text (journalVM.selectedJournal.waterAmount)
                        Text("ml")
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
        }
    }
}

struct MemoDetails: View {
    
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {
        if journalVM.selectedJournal.memo != "" && journalVM.selectedJournal.memo != "Describe what you feel…" {
            VStack (alignment: .leading) {
                HStack{
                    Text(journalVM.selectedJournal.memo)
                }
                Divider()
                    .frame(height: 1)
                    .background(.gray)
            }
        }
        
    }
}

struct ExperienceMemo: View {
    @ObservedObject var journalVM: JournalViewModel
    let maximumRating: Int = 5
    
    var body: some View {
        if journalVM.selectedJournal.experienceRating > 0 {
            VStack{
                VStack(alignment: .center) {
                    Text("Experience Rating")
                        .padding(.bottom)
                }
                HStack{
                    Spacer()
                    ForEach(1..<maximumRating + 1, id: \.self) { number in
                        image(for: number)
                            .resizable().frame(width: 43, height: 30)
                        Spacer()
                    }
                }
                .padding(.top, -8.0)
                .padding(.bottom)
            }
        }
    }
    func image(for number: Int) -> Image {
        if number > journalVM.selectedJournal.experienceRating {
            return imageCoffeeNotActive
        } else {
            return imageCoffeeActive
        }
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

struct JournalDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            JournalDetail(journalVM: JournalViewModel()).previewDisplayName("Testing 1")
            JournalDetail(journalVM: JournalViewModel(selectedJournal: JournalModel(name: "Gayo", coffeeName: "dirumah", location: "String", coffeeOrigin: "String", variety: "String", roastDate: Date.now, process: "kartika", method: "v60", memo: "asass", photoUrls: [], experienceRating: 1, temperature: "90", coffeeAmount: "15", waterAmount: "20"))).previewDisplayName("Testing 2")
        }
        
    }
}
