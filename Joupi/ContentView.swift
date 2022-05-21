//
//  ContentView.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isStart") private var isStart: Bool = false
    
    var body: some View {
        if isStart {
            MainScreen()
        } else {
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
