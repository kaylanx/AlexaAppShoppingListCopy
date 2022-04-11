//
//  ContentView.swift
//  AlexaAppShoppingListCopy
//
//  Created by Andy Kayley on 10/04/2022.
//

import SwiftUI

let alexaBlueColor = Color(red:0.05, green: 0.39, blue: 0.66)

struct ContentView: View {

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
