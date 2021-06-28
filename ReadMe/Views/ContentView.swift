//
//  ContentView.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var library = Library()
    
    var body: some View {
        NavigationView {
            List(library.sortedBooks) { book in
                BookRow(book: book, image: $library.uiImages[book])
            }.navigationBarTitle("My Library")
        }
    }
}

struct BookRow: View {
    
    @ObservedObject var book: Book
    
    @Binding var image: UIImage?
    
    var body: some View {
        
        
        NavigationLink(
            destination: DetailView(book: book, image: $image),
            label: {
                HStack {
                    Book.Image(uiImage: image, title: book.title, imageSize: 80, cornerRadius: 20)
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
            .previewInAllColorSchemes
    }
}



