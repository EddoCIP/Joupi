//
//  MainScreen.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct MainScreen: View {
    @State private var searchKeyword: String = ""
    //        @State var journalList: [JournalModel] = [
    //            JournalModel(name: "Coba", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
    //            JournalModel(name: "Dapur", coffeeName: "Tubruk", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
    //            JournalModel(name: "Coffee", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
    //        ]
    @State private var journalList: [JournalModel] = []
    @State var isAddJournal: Bool = false
    @State var isSearching: Bool = false
    @State var sortBy: String = "date"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Good Afternoon")
                            .font(.largeTitle)
                            .foregroundColor(Color("TitleFontColor"))
                            .fontWeight(.bold)
                            .padding(.leading, 13)
                        Text(formatDateToString(date: Date.now, format: "EEEE, dd MMM YYYY"))
                            .font(.caption)
                            .foregroundColor(Color("TitleFontColor"))
                            .padding(.leading, 13)
                        SearchBar(searchText: $searchKeyword, searching: $isSearching)
                    }
                    .background(Color("BackgroundColor"))
                    Divider()
                        .frame(height: 2)
                        .background(.black)
                        .padding(.leading)
                        .padding(.trailing)
                    HStack {
                        Text("Sort by \(sortBy)")
                            .font(.title3)
                            .foregroundColor(Color("TitleFontColor"))
                        Spacer()
                        Menu {
                            Picker(selection: $sortBy) {
                                HStack {
                                    Text("Sort by date")
                                    Spacer()
                                    Image(systemName: "textformat.123")
                                }.tag("date")
                                HStack {
                                    Text("Sort by name")
                                    Spacer()
                                    Image(systemName: "textformat.abc")
                                }.tag("name")
                            } label: {
                                //                                Image(systemName: "arrow.up.arrow.down.square")
                            }
                        } label: {
                            Image(systemName: "arrow.up.arrow.down.square")
                        }
                        .foregroundColor(Color("TitleFontColor"))
                    }
                    .padding(.trailing)
                    .padding(.leading)
                    ZStack {
                        if journalList.count > 0 {
                            ScrollView {
                                VStack(alignment: .leading, spacing: 10) {
                                    ForEach(sortedList, id: \.self) { item in
                                        //                                NavigationLink(destination: Text(item.coffeeName)) {
                                        JournalCard(journal: item, size: 100)
                                        //                                }
                                    }
                                }
                            }.frame(maxWidth: .infinity)
                        } else {
                            VStack {
                                Image(systemName: "cup.and.saucer")
                                    .resizable()
                                    .foregroundColor(Color("SemiColor"))
                                    .frame(width: 144, height: 109)
                                Text("Create Your First Journal")
                                    .foregroundColor(Color("SemiColor"))
                                    .fontWeight(.semibold)
                            }
                            .offset(y: -40)
                            .frame(width: UIScreen.main.bounds.width)
                        }
                        
                        VStack {
                            Spacer()
                            Button("Create", action: {
                                withAnimation {
                                    isAddJournal.toggle()
                                }
                            })
                            .frame(width: 200, height: 50)
                            .background(Color("TitleFontColor"))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        }
                        .zIndex(1)
                        .padding()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .background(
                    NavigationLink("", isActive: $isAddJournal) {
                        JournalAdd(journalList: $journalList)
                    }
                )
            }
        }
    }
    
    var searchResults: [JournalModel] {
        if searchKeyword.isEmpty {
            return journalList
        } else {
            return journalList.filter { $0.coffeeName.lowercased().contains(searchKeyword.lowercased()) }
        }
    }
    
    var sortedList: [JournalModel] {
        if sortBy == "date" {
            return searchResults.sorted { a, b in
                b.createdDate > a.createdDate
            }
        }
        
        return journalList.sorted { a, b in
            b.name.lowercased() > a.name.lowercased()
        }
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
