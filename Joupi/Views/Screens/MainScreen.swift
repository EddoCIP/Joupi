//
//  MainScreen.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct MainScreen: View {
    @State private var searchKeyword: String = ""
//    @State var coffeeList: [String] = ["V60", "Cappucinno", "Vietnam", "Tubruk", "crema"]
    @State var journalList: [JournalModel] = [
        JournalModel(name: "Coba", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Dapur", coffeeName: "Tubruk", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Coffee", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-20")),
        JournalModel(name: "latte", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-20")),
        JournalModel(name: "tubruk", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-20")),
        JournalModel(name: "minum dimana hayo", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-20")),
        JournalModel(name: "sama siapa hayo", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-20")),
        JournalModel(name: "ah bingung", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-20")),
    ]
    //    @State private var journalList: [JournalModel] = []
    @State var isAddJournal: Bool = false
    @State var isSearching: Bool = false
    @State var isShowDetail: Bool = false
    @State var sortBy: String = "date"
    @State var selectedJournal: JournalModel?
    
    let screenSize = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Good Afternoon")
                            .font(.largeTitle)
                            .foregroundColor(Color("PrimaryAccentColor"))
                            .fontWeight(.bold)
                            .padding(.leading, 13)
                        Text(formatDateToString(date: Date.now, format: "EEEE, dd MMM YYYY"))
                            .font(.caption)
                            .foregroundColor(Color("PrimaryAccentColor"))
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
                            .foregroundColor(Color("PrimaryAccentColor"))
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
                        .foregroundColor(Color("PrimaryAccentColor"))
                    }
                    .padding(.trailing)
                    .padding(.leading)
                    ZStack {
                        if journalList.count > 0 {
                            ScrollView {
                                VStack(alignment: .leading, spacing: 10) {
                                    ForEach(sortedList, id: \.self) { item in
                                        //                                NavigationLink(destination: Text(item.coffeeName)) {
                                        JournalCard(journal: item, size: screenSize)
                                            .onTapGesture {
                                                selectedJournal = item
                                                isShowDetail.toggle()
                                            }
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
                            .background(Color("PrimaryAccentColor"))
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
                        EmptyView() // nanti formnya taro sini
                    }
                )
                .background(
                    NavigationLink("", isActive: $isShowDetail) {
                        Text(selectedJournal?.name ?? "")
                    }
                )
            }
            .navigationTitle("My Coffee Journal")
            .navigationBarColor(UIColor(named: "TitleBarColor"), UIColor(named: "TitleFontColor"))
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchKeyword, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
            .background(
                NavigationLink("", isActive: $isAddJournal) {
                    JournalAdd(journalList: $journalList) // nanti formnya taro sini
                }
            )
        }
    }
    
    var searchResults: [JournalModel] {
        if searchKeyword.isEmpty {
            return journalList
        } else {
            return journalList.filter { $0.location.lowercased().contains(searchKeyword.lowercased())
                ||
                $0.name.lowercased().contains(searchKeyword.lowercased())
            }
        }
    }
    
    var sortedList: [JournalModel] {
        if sortBy == "date" {
            return searchResults.sorted { a, b in
                a.createdDate > b.createdDate // ascending
            }
        }
        
        return journalList.sorted { a, b in
            a.name.lowercased() < b.name.lowercased()
        }
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
