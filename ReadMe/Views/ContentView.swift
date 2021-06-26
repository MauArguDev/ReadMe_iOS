//
//  ContentView.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Library().sortedBooks, id: \.title) { book in
                BookRow(book: book)
            }.navigationBarTitle("My Library")
        }
    }
}

struct BookRow: View {
    
    let book: Book
    
    var body: some View {
        
        NavigationLink(
            destination: DetailView(book: book),
            label: {
                HStack {
                    Book.Image(title: book.title, imageSize: 80)
                    VStack(alignment: .leading){
                        Title(text:book.title, font: .title2)
                        Author(text:book.author, font: .title3)
                    }.lineLimit(1)
                }

            })
        
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



