//
//  Coffee.swift
//  Joupi
//
//  Created by Rafik Lutfi on 18/05/22.
//

import SwiftUI

struct Coffee {
    let coffeeName: String
    let location: String
    let beansRegion: String
    let variety: String
    let roastDate: String
    let process: String
    let method: String
    let coffeeMemo: String
    let imageName: String
}

struct CoffeeList {
    
    static let topTen = [
        Coffee(coffeeName: "Solok Radjo v60",
               location: "Anchor Coffee Roastery",
               beansRegion: "Solok, Sumatera Barat",
               variety: "Sigararutang",
               roastDate: "February 17, 2022",
               process: "Natural",
               method: "v60",
               coffeeMemo: "Kopinya enak dan fruity",
               imageName: "kopi-solok"),
        
        Coffee(coffeeName: "Solok gayo pakai kalita wave",
               location: "Rumah siKopi banget",
               beansRegion: "Gayo, Aceh",
               variety: "Sigararutang",
               roastDate: "Maret 20, 2022",
               process: "Semi Wash",
               method: "Kalita Wave",
               coffeeMemo: "Kopinya clean, aftertaste nya juga enak dan long",
               imageName: "kopi-gayo"),
        
//        Coffee(coffeeName: "Solok Radjo v60",
//               location: "Anchor Coffee Roastery",
//               beansRegion: "String",
//               variety: "Sigararutang",
//               roastDate: "February 17, 2022",
//               process: "Natural",
//               method: "v60",
//               coffeeMemo: "Kopinya enak dan fruity",
//               imageName: "kopi-solok"),
//
//        Coffee(coffeeName: "Solok Radjo v60",
//               location: "Anchor Coffee Roastery",
//               beansRegion: "String",
//               variety: "Sigararutang",
//               roastDate: "February 17, 2022",
//               process: "Natural",
//               method: "v60",
//               coffeeMemo: "Kopinya enak dan fruity",
//               imageName: "kopi-solok"),
    ]
}
