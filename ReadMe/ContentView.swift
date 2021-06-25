//
//  ContentView.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.light))
                .foregroundColor(.secondary)
            Text("Title")
                .font(.title2)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
