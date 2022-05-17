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
    
    let gradient = Gradient(colors: [Color("PrimaryColor"), .white])
    let gradientStop = Gradient(stops: [.init(color: Color("PrimaryColor"), location: 0),
                                        .init(color: .white, location: 0.8)])
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                BottomSheetContent(offset: $offsetY)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                //                LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                LinearGradient(
                    stops:
                        [
                            .init(color: Color("PrimaryColor"), location: 0),
                            .init(color: .white, location: 1)
                        ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
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
            .onAppear {
                let percentile = proxy.size.height / 10
                offsetY = percentile * 4
            }
            .ignoresSafeArea(edges: .bottom)
            
        }
    }
}

struct BottomSheetContent: View {
    @State private var showSearchBar: Bool = false
    @State private var gridColumns = [GridItem(.adaptive(minimum: 150))]
    @State private var searchBar = ""
    @Binding var offset: CGFloat
    
    let journalSize = (UIScreen.main.bounds.width / 2) * 0.8
    let data: [[String]] = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["8", "8", "9"], ["9", "8", "9"]]
    
    var body: some View {
        VStack {
            if showSearchBar == false {
                ZStack {
                    Text("My Coffee Journal")
                        .font(.title2)
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                showSearchBar.toggle()
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }.padding()
            } else {
                VStack {
                    Text("My Coffee Journal")
                        .font(.title2)
                    HStack {
                        TextField("Search", text: $searchBar)
                            .onChange(of: searchBar) { newValue in
                                print(newValue)
                            }
                            .textFieldStyle(.roundedBorder)
                        Button("Cancel") {
                            withAnimation {
                                showSearchBar.toggle()
                                searchBar = ""
                            }
                        }
                    }
                }.padding()
            }
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(data, id: \.self) { item in
                        JournalCard(imageUrls: item, size: journalSize)
                            .frame(width: journalSize, height: journalSize * 1.5)
                            .padding()
                    }
                }
                if offset != .zero {
                    HStack {
                        Spacer()
                    }
                    .frame(width: journalSize, height: journalSize * 1.5)
                }
            }
        }
    }
}
