//
//  JournalAdd.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI

struct JournalAdd: View {
    @Binding var journalList: [JournalModel]
    @State var journalTitle: String = ""
    
    
    var body: some View {
        VStack{
            Form{
                CupOfCoffee(journalTitle: $journalTitle)
                BeansList()
//                AdditionalInfo()
            }
        }
        
    }
}

struct CupOfCoffee: View {
    
    @State var isProfileSectionExpanded = true
    @State var selectIndexNotes: Int = 0
    @Binding var journalTitle: String
    
    var body: some View {
        //        Form{
        Section{
            DisclosureGroup (isExpanded: $isProfileSectionExpanded){
                TextField("Coffee Name", text: $journalTitle)
                TextField("Insert Location Name", text: .constant(""))
            }label: {
                Text("Cup Of Coffee")
            }
        }
        //        }
    }
}

struct BeansList: View {
    
    @State var roastDate = Date()
    @State var isProfileSectionExpanded = true
    @State var selectIndexNotes: String = ""
    
    var tasteNotes: [String] = ["Citrus", "Sour", "Fruity"]
    
    var body: some View {
        //        Form{
        Section{
            DisclosureGroup{
                TextField("Insert Beans Region", text: .constant(""))
                HStack{
                    Text("Tasting Notes")
                    Spacer()
                    Picker(selection:$selectIndexNotes, label: Text("Tasting Notes"), content: {
                        ForEach(tasteNotes, id: \.self) {
                            item in
                            Text(item).tag(item)
                        }
                    })
                    .pickerStyle(MenuPickerStyle())
                }
                TextField("Region Area", text: .constant(""))
                TextField("Altitude in MASL", text: .constant(""))
                TextField("Variety", text: .constant(""))
                DatePicker("Roast Date",
                           selection: $roastDate, displayedComponents: [.date]).accentColor(.brown)
                TextField("Roast Level", text: .constant(""))
                TextField("process", text: .constant(""))
            }label: {
                Text("Additional Info")
            }
        }
        //        }
    }
}





// journalList.append(JournalModel)
struct JournalAdd_Previews: PreviewProvider {
    static var previews: some View {
        JournalAdd(journalList: .constant([JournalModel(name: "Test", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1)]), journalTitle: "")
    }
}
