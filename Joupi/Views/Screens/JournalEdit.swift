//
//  JournalEdit.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalEdit: View {
    
    @Binding var journalList: [JournalModel]
    @State var journalTitle: String = ""
    
    var body: some View {
        VStack{
            Form{
                CupOfCoffee(journalTitle: $journalTitle)
                BeansList()
            }
        }
    }
}

struct JournalEdit_Previews: PreviewProvider {
    static var previews: some View {
        JournalEdit(journalList: .constant([JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1)]), journalTitle: "")
    }
}
