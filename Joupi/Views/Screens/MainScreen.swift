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
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "Tubruk", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1),
        JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1)
    ]
    @State var isAddJournal: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(searchResults, id: \.self) { item in
                        NavigationLink(destination: Text(item.coffeeName)) {
                            JournalCard(journal: item, size: 100)
                        }
                    }
                    .onMove(perform: move)
                }
                .toolbar {
                    EditButton()
                }
                .listStyle(.plain)
                VStack {
                    Spacer()
                    Button("Add Journal", action: {
                        withAnimation {
                            isAddJournal.toggle()
                        }
                    })
                    .frame(width: 200, height: 50)
                    .background(.blue)
                    .foregroundColor(.black)
                    .cornerRadius(25)
                }
                .zIndex(1)
                .padding()
            }
            .navigationTitle("My Coffee Journal")
            .navigationBarColor(UIColor(named: "TitleBarColor"), UIColor(named: "TitleFontColor"))
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchKeyword, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
            .background(
                NavigationLink("", isActive: $isAddJournal) {
                    EmptyView() // nanti formnya taro sini
                }
            )
        }
    }
    
    var searchResults: [JournalModel] {
        if searchKeyword.isEmpty {
            return journalList
        } else {
            return journalList.filter { $0.coffeeName.lowercased().contains(searchKeyword.lowercased()) }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        journalList.move(fromOffsets: source, toOffset: destination)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
