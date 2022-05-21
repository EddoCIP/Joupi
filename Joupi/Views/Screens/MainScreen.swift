//
//  MainScreen.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct MainScreen: View {
    @State private var searchKeyword: String = ""
    @State var isAddJournal: Bool = false
    @State var isSearching: Bool = false
    @State var isShowDetail: Bool = false
    @State var sortBy: String = "date"
    @State var selectedJournal: JournalModel?
    
    let screenSize = UIScreen.main.bounds.width
    
    @StateObject var journalVM = JournalViewModel()
    
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
                        if journalVM.journalList.count > 0 {
                            ScrollView {
                                VStack(alignment: .leading, spacing: 10) {
                                    ForEach(sortList(list: searchResults), id: \.self) { item in
                                        JournalCard(journal: item, size: screenSize)
                                            .onTapGesture {
                                                selectedJournal = item
                                                journalVM.selectedJournal = item
                                                isShowDetail.toggle()
                                            }
                                    }
                                }
                            }.frame(maxWidth: screenSize)
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
                            .frame(width: screenSize)
                        }
                        
                        VStack {
                            Spacer()
                            Button {
                                withAnimation {
                                    journalVM.selectedJournal = JournalModel()
                                    isAddJournal.toggle()
                                }
                            } label: {
                                Text("Create")
                                    .frame(width: 200, height: 50)
                                    .background(Color("PrimaryAccentColor"))
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                                    .padding(.bottom, -10)
                                    .padding(.top, 15)
                            }
                            .if(isSearching, transform: { view in
                                view.hidden()
                            })
                        }
                        .zIndex(1)
                        .padding()
                    }
                }
                .background(
                    NavigationLink("", isActive: $isShowDetail) {
//                        JournalForm(journalVM: journalVM,action: .edit)
                        JournalDetail(journalVM: journalVM)
                    }
                )
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink("", isActive: $isAddJournal) {
                    JournalForm(journalVM: journalVM,action: .add)
                }
            )
        }
    }
    
    var searchResults: [JournalModel] {
        if searchKeyword.isEmpty {
            return journalVM.journalList
        } else {
            return journalVM.journalList.filter { $0.location.lowercased().contains(searchKeyword.lowercased())
                ||
                $0.name.lowercased().contains(searchKeyword.lowercased())
            }
        }
    }
    
    func sortList(list: [JournalModel]) -> [JournalModel] {
        if sortBy == "date" {
            return list.sorted { a, b in
                a.createdDate > b.createdDate // ascending
            }
        }
        
        return list.sorted { a, b in
            a.name.lowercased() < b.name.lowercased()
        }
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
