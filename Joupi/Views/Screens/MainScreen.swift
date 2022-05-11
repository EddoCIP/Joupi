//
//  MainScreen.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct MainScreen: View {
    @State var scrollOffset: CGFloat = .zero
    private static let initialColumns = 2
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private var numColumns = initialColumns
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    private var hasScrolled: Bool {
        scrollOffset > 0
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !hasScrolled {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: screenWidth, height: 200)
                        .overlay {
                            Text("Hi Coffee enthusiast")
                                .bold()
                        }
                } else {
                    Text("My Journal Ngopi")
                        .bold()
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.brown)
                        .frame(width: screenWidth, height: screenHeight)
                        .cornerRadius(10)
                    VStack {
                        ObservableScrollView(scrollOffset: $scrollOffset) { _ in
                            LazyVGrid(columns: gridColumns) {
                                
                            }
                        }
                        Button("Create Journal") {
                            
                        }
                    }
                }
            }
            //            ScrollView {
            //                VStack {
            //                    Text("Hi Coffee enthusiast")
            //                    ZStack {
            //                        Rectangle()
            //                            .foregroundColor(.brown)
            //                            .ignoresSafeArea()
            //                        VStack {
            //                            Text("My Journal Ngopi")
            //                            Spacer()
            //                            Text("Your Journal is still empty.")
            //                            Text("Let's create a new one!")
            //                            Spacer()
            //                            Button("Create Journal") {
            //
            //                            }
            //                        }
            //                    }
            //                }
            //                .navigationBarHidden(true)
            //                .navigationViewStyle(StackNavigationViewStyle())
            //            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
