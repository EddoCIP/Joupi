//
//  Helpers.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 14/05/22.
//

import Foundation
import SwiftUI

var variety: [String] = ["Sigararutang", "Kartika", "Gesha"]
var process: [String] = ["Natural", "Wash", "Semi Wash", ]
var Method: [String] = ["V60", "Kalita Wave", "French Press", "Tubruk", "Aeropress"]

func formatDateToString(date: Date, format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    
    return formatter.string(from: date)
}

func formatStringToDate(dateString: String) -> Date {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd"
    
    return formatter.date(from: dateString) ?? Date()
}

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        
        let coloredAppearance = UINavigationBarAppearance()
//        let a = UINavigationItem()
//        let b = UINavigationController()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.accessibilityFrame = CGRect(x: 0, y: 0, width: 200, height: 200)
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .systemBlue
//        UINavigationBar.appearance().prefersLargeTitles = true
//        a.largeTitleDisplayMode = .always
//        b.navigationBar.prefersLargeTitles = true
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?, _ titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

// enable swipe to close
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

extension UIApplication {
     func dismissKeyboard() {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
 }

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
