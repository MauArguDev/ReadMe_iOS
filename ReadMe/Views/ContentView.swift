//
//  ContentView.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI

struct ContentView: View {
  @State var addingNewBook = false
  @EnvironmentObject var library: Library

  var body: some View {
    NavigationView {
      List {
        Button {
          addingNewBook = true
        } label: {
          Spacer()

          VStack(spacing: 6) {
            Image(systemName: "book.circle")
              .font(.system(size: 60))
            Text("Add New Book")
              .font(.title2)
          }
          
          Spacer()
        }
        .buttonStyle(BorderlessButtonStyle())
        .padding(.vertical, 8)
        .sheet(
          isPresented: $addingNewBook,
          content: NewBookView.init
        )

        ForEach(library.sortedBooks) { book in
          BookRow(book: book)
        }
      }
      .navigationBarTitle("My Library")
    }
  }
}

struct BookRow: View {
    
    @ObservedObject var book: Book
    
    @EnvironmentObject var library : Library
    
    var body: some View {
        
        
        NavigationLink(
            destination: DetailView(book: book),
            label: {
                HStack {
                    Book.Image(uiImage: library.uiImages[book], title: book.title, imageSize: 80, cornerRadius: 20)
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Title(text:book.title, font: .title2)
                            Author(text:book.author, font: .title3)
                        }
                        if !book.microReview.isEmpty{
                            Spacer()
                            Text(book.microReview)
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                    }.lineLimit(1)
                    Spacer()
                    BookmarkButton(book: book)
                        .buttonStyle(BorderlessButtonStyle())
                }
                .padding(.vertical, 8)

            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
            .previewInAllColorSchemes
    }
}



