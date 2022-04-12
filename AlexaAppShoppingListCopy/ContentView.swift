//
//  ContentView.swift
//  AlexaAppShoppingListCopy
//
//  Created by Andy Kayley on 10/04/2022.
//

import SwiftUI

let alexaBlueColor = Color(red:0.05, green: 0.39, blue: 0.66)

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? alexaBlueColor : Color.secondary)
            .onTapGesture {
                withAnimation {
                    self.checked.toggle()
                }
            }
    }
}

struct ListItemView: View {

    @Binding var item: Item

    var body: some View {
        HStack {
            CheckBoxView(checked: $item.completed)
            Text(item.name)
                .padding()
        }
    }
}

struct Item: Identifiable {
    var id: UUID = UUID()
    let name: String
    var completed: Bool
}

class ListItemsViewModel: ObservableObject {

    @Published var items = [
        Item(name: "Oxo cubes", completed: false),
        Item(name: "Flavoured water", completed: false),
        Item(name: "Baby wipes", completed: false),
        Item(name: "Drainer", completed: false),
        Item(name: "Bread knife 🔪", completed: false),
        Item(name: "Piping bag", completed: false),

        Item(name: "Potatoes", completed: true),
        Item(name: "Bread", completed: true),
        Item(name: "Rinse aid", completed: true),
    ]
}

struct ContentView: View {

    @StateObject private var viewModel = ListItemsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Button {

                } label: {
                    Text("Add Item".uppercased())
                        .bold()
                        .padding(2)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
                .buttonStyle(.bordered)
                .background(alexaBlueColor)
                .cornerRadius(5)
                .padding(10)

                List {

                    ForEach($viewModel.items) { $item in
                        if (item.completed == false) {
                            ListItemView(item: $item)
                        }
                    }

                    Section {
                        ForEach($viewModel.items) { $item in
                            if (item.completed == true) {
                                ListItemView(item: $item)
                            }
                        }
                    } header: {
                        Text("Completed")
                            .bold()
                            .foregroundColor(.black)
                    }
                }
                .listStyle(.grouped)


                Spacer()
            }
            .navigationTitle("Shopping".uppercased())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                HStack {
                    Button("Share") {

                    }
                    .foregroundColor(.primary)
                    Button {

                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(-90))
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
