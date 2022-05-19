//
//  OnboardingView.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 19/05/22.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isStart: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()
                        Text("JOUPI")
                            .font(.headline)
                            .foregroundColor(Color("BackgroundColor"))
                        Image(systemName: "cup.and.saucer")
                            .resizable()
                            .frame(width: 144, height: 109)
                            .foregroundColor(Color("BackgroundColor"))
                    }
                }
                .background(Color("TitleFontColor"))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.35)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("1. Journal")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Record your coffee experience journal by cup of coffee, beans and method.")
                            .font(.body)
                    }.padding([.bottom, .leading, .trailing])
                    VStack(alignment: .leading) {
                        Text("2. Search & Sort")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Find the recorded coffee experience by journal title and two option of sort, by drink date and by name.")
                            .font(.body)
                    }.padding([.bottom, .leading, .trailing])
                    VStack(alignment: .leading) {
                        Text("3. View")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("View the recorded and detail of coffee experience journal.")
                            .font(.body)
                    }.padding([.bottom, .leading, .trailing])
                }.padding()
                Spacer()
            }
            VStack {
                Spacer()
                Button("Get Started") {
                    withAnimation {
                        isStart.toggle()
                    }
                }
                .frame(width: 200, height: 50)
                .background(Color("TitleFontColor"))
                .foregroundColor(.white)
                .cornerRadius(30)
            }
            .zIndex(1)
            .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isStart: .constant(false))
    }
}
