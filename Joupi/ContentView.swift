//
//  ContentView.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isStart: Bool = false
    
    var body: some View {
        if isStart {
            MainScreen()
        } else {
            OnboardingView(isStart: $isStart)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
