//
//  MainScreen.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct MainScreen: View {
    @State private var test: String = ""
    var body: some View {
        
        ZStack {
            //                MainScreen()
            BottomSheet()
                .zIndex(1)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        //        MainScreen()
        BottomSheet()
    }
}

struct BottomSheet: View {
    @State private var translation: CGSize = .zero
    @State var offsetY: CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                BottomSheetContent()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.brown)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(y: translation.height + offsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded{ value in
                        withAnimation(.easeInOut) {
                            let snap = translation.height + offsetY
                            let percentile = proxy.size.height / 10
                            
                            if snap > percentile * 2 {
                                offsetY = percentile * 4
                            } else {
                                offsetY = 0
                            }
                            
                            translation = .zero
                        }
                    }
            )
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct BottomSheetContent: View {
    @State private var showSearchBar: Bool = false
    @State private var gridColumns = [GridItem(.adaptive(minimum: 150))]
    @State private var searchBar = ""
    let data: [[String]] = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
    
    var body: some View {
        VStack {
            if showSearchBar == false {
                HStack {
                    Spacer()
                    Text("My Journal")
                        .font(.title)
                    Spacer()
                    Button {
                        showSearchBar.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }.padding()
            } else {
                VStack {
                    Text("My Journal")
                        .font(.title)
                    HStack {
                        TextField("Search", text: $searchBar)
                            .onChange(of: searchBar) { newValue in
                                print(newValue)
                            }
                            .textFieldStyle(.roundedBorder)
                        Button("Cancel") {
                            showSearchBar.toggle()
                            searchBar = ""
                        }
                    }
                }.padding()
            }
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(data, id: \.self) { item in
                        GeometryReader { geo in
                            //                        NavigationLink(destination: DetailView(item: item)) {
                            JournalCard(imageUrls: item, size: geo.size.width)
                            //                        }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
