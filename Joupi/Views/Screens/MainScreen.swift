//
//  MainScreen.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct MainScreen: View {
    @State private var searchKeyword: String = ""
    @State var coffeeList: [String] = ["V60", "Cappucinno", "Vietnam", "Tubruk", "crema"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("TitleBarColor")
                    .ignoresSafeArea()
                List {
                    ForEach(searchResults, id: \.self) { item in
                        NavigationLink(destination: Text(item)) {
                            VStack {
                                Text(item)
                                    .font(.title)
                                Text(item)
                                    .font(.title)
                                Text(item)
                                    .font(.title)
                                Text(item)
                                    .font(.title)
                            }
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
                        
                    })
                    .frame(width: 200, height: 50)
                    .background(.blue)
                    .foregroundColor(.black)
                    .cornerRadius(25)
                }
                .zIndex(1)
                .padding()
            }
            .navigationTitle(
                Text("My Coffee Journal")
                    .foregroundColor(.blue)
            )
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchKeyword, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        }
    }
    
    var searchResults: [String] {
        if searchKeyword.isEmpty {
            return coffeeList
        } else {
            return coffeeList.filter { $0.contains(searchKeyword) }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        coffeeList.move(fromOffsets: source, toOffset: destination)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
