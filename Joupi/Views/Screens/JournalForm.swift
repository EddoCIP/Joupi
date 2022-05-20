//
//  JournalAdd.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 11/05/22.
//

import SwiftUI
import Combine

class JournalViewModel: ObservableObject {
    // lookup pro
    // jika pindah ke core data, fetch data disini
    //    @Published var journalList: [JournalModel] = [
    //        JournalModel(name: "Coba", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, temperature: "", coffeeAmount: "", waterAmount: ""),
    //        JournalModel(name: "Dapur", coffeeName: "Tubruk", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, temperature: "", coffeeAmount: "", waterAmount: ""),
    //        JournalModel(name: "Coffee", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-20"), temperature: "", coffeeAmount: "", waterAmount: ""),
    //        JournalModel(name: "latte", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-19"), temperature: "", coffeeAmount: "", waterAmount: ""),
    //        JournalModel(name: "tubruk", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-10"), temperature: "", coffeeAmount: "", waterAmount: ""),
    //        JournalModel(name: "minum dimana hayo", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-17"), temperature: "", coffeeAmount: "", waterAmount: ""),
    //        JournalModel(name: "sama siapa hayo", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-02"), temperature: "", coffeeAmount: "", waterAmount: ""),
    //        JournalModel(name: "ah bingung", coffeeName: "V60", location: "Jakarta", coffeeOrigin: "Aceh", variety: "Gayo", roastDate: Date.now, process: "Full", method: "Pour", memo: "entah", photoUrls: [], experienceRating: 1, createdDate: formatStringToDate(dateString: "2022-05-01"), temperature: "", coffeeAmount: "", waterAmount: ""),
    //    ]
    
    @Published var journalList: [JournalModel] = []
    
    @Published var selectedJournal : JournalModel = JournalModel()
    
    func clear() {
        selectedJournal = JournalModel()
    }
    
    func saveJournal() {
        journalList.append(selectedJournal)
        clear()
    }
    
    func editJournal(){
        journalList = journalList.map({ journal in
            if journal.id == selectedJournal.id{
                return selectedJournal
            }
            return journal
        })
        
    }
}

enum JournalAction{
    case add
    case edit
}

struct JournalForm: View {
    @ObservedObject var journalVM : JournalViewModel
    var action : JournalAction
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            Form{
                CupOfCoffee(journalVM: journalVM)
                BeansList(journalVM: journalVM)
            }
            Button {
                withAnimation {
                    if action == .add{
                        self.journalVM.saveJournal()
                    }else{
                        self.journalVM.editJournal()
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text(action == .add ? "Add Journal" : "Edit Journal")
                    .frame(width: 200, height: 50)
                    .background(Color("PrimaryAccentColor"))
                    .foregroundColor(Color("BackgroundColor"))
                    .cornerRadius(25)
                    .padding(.bottom, 10)
                    .padding(.top, 15)
            }
            .navigationTitle(action == .add ? "Add Journal" : "Edit Journal")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
        }.background(Color("FormBackgroundColor"))
    }
}

struct CupOfCoffee: View {
    @State var isProfileSectionExpanded = true
    @State var selectIndexNotes: Int = 0
    @ObservedObject var journalVM: JournalViewModel
    
    var body: some View {
        Section{
            DisclosureGroup (isExpanded: $isProfileSectionExpanded){
                TextField("My Journal Title", text: $journalVM.selectedJournal.name)
                TextField("My Journal Location", text: $journalVM.selectedJournal.location)
            }label: {
                Text("Cup Of Coffee")
            }
        }
    }
}

struct BeansList: View {
    @State var roastDate = Date()
    @State var isProfileSectionExpanded = true
    @ObservedObject var journalVM: JournalViewModel
    @State var isAddJournal: Bool = false
    @State private var showConfirmationDialog : Bool = false
    @State private var imagePickerMode = 0
    @State private var showImagePicker: Bool = false
    
    //    let screenSize = UIScreen.main.bounds.width
    let imageCoffeeActive = Image("ImageCoffeeActive")
    let imageCoffeeNotActive = Image("ImageCoffeeNonActive")
    let maximumRating: Int = 5
    
    var body: some View {
        Section{
            DisclosureGroup(isExpanded: $isProfileSectionExpanded){
                TextField("Beans Region", text: $journalVM.selectedJournal.coffeeOrigin)
                HStack{
                    Text("Variety")
                    Spacer()
                    Picker(selection:$journalVM.selectedJournal.variety, label: Text("Variety"), content: {
                        ForEach(variety, id: \.self) {
                            item in
                            Text(item).tag(item)
                        }
                    })
                    .pickerStyle(MenuPickerStyle())
                }
                DatePicker("Roast Date",
                           selection: $journalVM.selectedJournal.roastDate, displayedComponents: [.date]).accentColor(Color("PrimaryAccentColor")).datePickerStyle(.compact)
                VStack(alignment: .leading) {
                    HStack{
                        Text("Process")
                        Spacer()
                        Picker(selection: $journalVM.selectedJournal.process, label: Text("process"), content: {
                            ForEach(process, id: \.self) {
                                item in
                                Text(item).tag(item)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                    }
                    Divider()
                    HStack{
                        Text("Method")
                        Spacer()
                        Picker(selection: $journalVM.selectedJournal.method, label: Text("method"), content: {
                            ForEach(Method, id: \.self) {
                                item in
                                Text(item).tag(item)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                    }
                    Divider()
                    HStack{
                        Text("Temperature")
                        Spacer()
                        TextField("Insert Value", text: $journalVM.selectedJournal.temperature)
                            .onReceive(Just(journalVM.selectedJournal.temperature)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.journalVM.selectedJournal.temperature = filtered
                                }
                            }
                        Text("c")
                    }
                    Divider()
                    HStack{
                        Text("Coffee Amount")
                        Spacer()
                        TextField("Insert Value", text: $journalVM.selectedJournal.coffeeAmount)
                            .onReceive(Just(journalVM.selectedJournal.coffeeAmount)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.journalVM.selectedJournal.coffeeAmount = filtered
                                }
                            }
                        Text("gr")
                    }
                    Divider()
                    HStack{
                        Text("Water Amount")
                        Spacer()
                        TextField("Insert Value", text: $journalVM.selectedJournal.waterAmount)
                            .onReceive(Just(journalVM.selectedJournal.waterAmount)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.journalVM.selectedJournal.waterAmount = filtered
                                }
                            }
                        Text("ml")
                    }
                }
                HStack{
                    TextEditor(text: $journalVM.selectedJournal.memo)
                        .padding(.leading, -6.0)
                        .foregroundColor(journalVM.selectedJournal.memo == "Describe what you feel…" ? .gray : .primary)
                        .onAppear{
                            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                                withAnimation {
                                    if journalVM.selectedJournal.memo == "Describe what you feel…" {
                                        journalVM.selectedJournal.memo = ""
                                    }
                                }
                            }
                            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                                withAnimation {
                                    if journalVM.selectedJournal.memo == "" {
                                        journalVM.selectedJournal.memo = "Describe what you feel…"
                                    }
                                }
                            }
                        }
                }
                VStack {
                    HStack{
                        Button {
                            self.showConfirmationDialog = true
                        } label: {
                            Label("Add Photo", systemImage: "plus.square.fill")
                        }.padding(.leading, -3.0)
                        Spacer()
                    }
                    VStack {
                        if journalVM.selectedJournal.photoUrls.count > 0 {
                            Divider()
                            ImageCarousel(imageUrls: $journalVM.selectedJournal.photoUrls)
                        }
                    }
                }.if(journalVM.selectedJournal.photoUrls.count > 0) { view in
                    view
                        .frame(minHeight: 250)
                }
                VStack(alignment: .leading){
                    Text("Experience Rating")
                        .padding(.bottom)
                    HStack{
                        ForEach(1..<maximumRating + 1, id: \.self) { number in
                            image(for: number)
                                .resizable().frame(width: 43, height: 30)
                                .onTapGesture {
                                    journalVM.selectedJournal.experienceRating = number
                                }
                            Spacer()
                        }
                    }
                    .padding(-8.0)
                    .padding(.bottom)
                }
            } label: {
                Text("Details")
            }.sheet(isPresented: self.$showImagePicker) {
                ImagePicker(isShown: $showImagePicker, imageUrls: $journalVM.selectedJournal.photoUrls, pickerMode: imagePickerMode)
            }
            .confirmationDialog("Testing", isPresented: $showConfirmationDialog) {
                Button("Take Photo") {
                    self.showImagePicker = true
                    self.imagePickerMode = 1
                }
                Button("Choose Existing") {
                    self.showImagePicker = true
                    self.imagePickerMode = 0
                }
                Button("Cancel", role: .cancel) {
                    
                }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > journalVM.selectedJournal.experienceRating {
            return imageCoffeeNotActive
        } else {
            return imageCoffeeActive
        }
    }
}

struct JournalForm_Previews: PreviewProvider {
    static var previews: some View {
        JournalForm(journalVM: JournalViewModel(),action: .add)
    }
}
