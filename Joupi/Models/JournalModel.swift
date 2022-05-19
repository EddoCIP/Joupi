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
}
