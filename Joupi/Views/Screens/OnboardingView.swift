//
//  OnboardingView.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 19/05/22.
//

import SwiftUI

struct OnboardingView: View {
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
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("BackgroundColor"))
                        Image(systemName: "cup.and.saucer")
                            .resizable()
                            .frame(width: 144, height: 109)
                            .foregroundColor(Color("BackgroundColor"))
                    }
                }
                .background(Color("PrimaryAccentColor"))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.35)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("1. Journal")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryAccentColor"))
                        Text("Record your coffee experience journal by cup of coffee, beans and method.")
                            .font(.body)
                            .foregroundColor(Color("PrimaryAccentColor"))
                    }.padding([.bottom, .leading, .trailing])
                    VStack(alignment: .leading) {
                        Text("2. Search & Sort")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryAccentColor"))
                        Text("Find the recorded coffee experience by journal title and two option of sort, by drink date and by name.")
                            .font(.body)
                            .foregroundColor(Color("PrimaryAccentColor"))
                    }.padding([.bottom, .leading, .trailing])
                    VStack(alignment: .leading) {
                        Text("3. View")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryAccentColor"))
                        Text("View the recorded and detail of coffee experience journal.")
                            .font(.body)
                            .foregroundColor(Color("PrimaryAccentColor"))
                    }.padding([.bottom, .leading, .trailing])
                }.padding()
                Spacer()
            }
            VStack {
                Spacer()
                Button {
                    withAnimation {
                        UserDefaults.standard.set(true, forKey: "isStart")
                    }
                } label: {
                    Text("Get Started")
                        .frame(width: 200, height: 50)
                        .background(Color("PrimaryAccentColor"))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .padding(.bottom, -10)
                        .padding(.top, 15)
                }
            }
            .zIndex(1)
            .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
