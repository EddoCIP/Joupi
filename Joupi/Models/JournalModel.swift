//
//  JournalModel.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 18/05/22.
//

import Foundation

struct JournalModel: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var coffeeName: String
    var location: String
    
    var coffeeOrigin: String
    var variety: String
    var roastDate: Date
    var process: String
    
    var method: String
    
    var memo: String
    var photoUrls: [String]
    var experienceRating: Int
    var createdDate: Date = Date.now
    var temperature: String
    var coffeeAmount: String
    var waterAmount: String
    
    init() {
        name = ""
        coffeeName = ""
        location = ""
        coffeeOrigin = ""
        variety = ""
        roastDate = Date()
        process = ""
        method = ""
        memo = ""
        photoUrls = []
        experienceRating = 0
        temperature = ""
        coffeeAmount = ""
        waterAmount = ""
    }
    init(name: String, coffeeName: String, location: String, coffeeOrigin: String, variety: String, roastDate: Date, process: String, method: String, memo: String, photoUrls: [String], experienceRating: Int, temperature: String, coffeeAmount: String, waterAmount: String) {
        self.name = name
        self.coffeeName = coffeeName
        self.location = location
        self.coffeeOrigin = coffeeOrigin
        self.variety = variety
        self.roastDate = roastDate
        self.process = process
        self.method = method
        self.memo = memo
        self.photoUrls = photoUrls
        self.experienceRating = experienceRating
        self.temperature = temperature
        self.coffeeAmount = coffeeAmount
        self.waterAmount = waterAmount
    }
    init(name: String, coffeeName: String, location: String, coffeeOrigin: String, variety: String, roastDate: Date, process: String, method: String, memo: String, photoUrls: [String], experienceRating: Int,createdDate: Date, temperature: String, coffeeAmount: String, waterAmount: String){
        self.name = name
        self.coffeeName = coffeeName
        self.location = location
        self.coffeeOrigin = coffeeOrigin
        self.variety = variety
        self.roastDate = roastDate
        self.process = process
        self.method = method
        self.memo = memo
        self.photoUrls = photoUrls
        self.experienceRating = experienceRating
        self.temperature = temperature
        self.coffeeAmount = coffeeAmount
        self.waterAmount = waterAmount
        self.createdDate = createdDate
    }
}
