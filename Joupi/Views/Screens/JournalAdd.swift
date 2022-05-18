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
                TextField("My Journal Title", text: $journalTitle)
                
                TextField("My Journal Location", text: .constant(""))
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
    //    @State var selectIndexNotes: String = ""
    @State var selectIndexVariety: String = ""
    @State var selectIndexProcess: String = ""
    @State var selectIndexMethod: String = ""
    @State var memo: String = "Type here"
    
    //    var tasteNotes: [String] = ["Citrus", "Sour", "Fruity"]
    var variety: [String] = ["Sigararutang", "Kartika", "Gesha"]
    var process: [String] = ["Natural", "Wash", "Semi Wash"]
    var Method: [String] = ["V60", "Kalita Wave", "French Press", "Tubruk", "Aeropress"]
    
    var body: some View {
        //        Form{
        Section{
            DisclosureGroup{
                TextField("Beans Region", text: .constant(""))
                HStack{
                    Text("Variety")
                    Spacer()
                    Picker(selection:$selectIndexVariety, label: Text("Variety"), content: {
                        ForEach(variety, id: \.self) {
                            item in
                            Text(item).tag(item)
                        }
                    })
                    .pickerStyle(MenuPickerStyle())
                }
                DatePicker("Roast Date",
                           selection: $roastDate, displayedComponents: [.date]).accentColor(.brown).datePickerStyle(.compact)
                HStack{
                    Text("Process")
                    Spacer()
                    Picker(selection:$selectIndexVariety, label: Text("process"), content: {
                        ForEach(process, id: \.self) {
                            item in
                            Text(item).tag(item)
                        }
                    })
                    .pickerStyle(MenuPickerStyle())
                }
                HStack{
                    Text("Method")
                    Spacer()
                    Picker(selection:$selectIndexMethod, label: Text("method"), content: {
                        ForEach(Method, id: \.self) {
                            item in
                            Text(item).tag(item)
                        }
                    })
                    .pickerStyle(MenuPickerStyle())
                }
                HStack{
                    Text("Temperatur")
                    Spacer()
                    TextField("Insert Value", text: .constant(""))
                    Text("c")
                }
                HStack{
                    Text("Coffee Amount")
                    Spacer()
                    TextField("Insert Value", text: .constant(""))
                    Text("gr")
                }
                HStack{
                    Text("Water Amount")
                    Spacer()
                    TextField("Insert Value", text: .constant(""))
                    Text("ml")
                }
                HStack{
                    TextEditor(text: self.$memo).foregroundColor(self.memo == "Type Here" ? .gray : .primary)
                        .onAppear{
                            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                                withAnimation {
                                    if self.memo == "Type here" {
                                        self.memo = ""
                                    }
                                }
                            }
                            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                                withAnimation {
                                    if self.memo == "" {
                                        self.memo = "Type here"
                                    }
                                }
                            }
                        }
                }
                HStack{
                    Button {
                        
                    } label: {
                        Label("Add Photo", systemImage: "plus.square.fill")
//                            .frame(width: 10, height: 10)
                    }
                    Spacer()
                        .padding()
                }
            }label: {
                Text("Details")
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
