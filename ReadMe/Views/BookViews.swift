//
//  BookViews.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI
import Combine

struct BookmarkButton : View {
    
    @ObservedObject var book: Book
    
    var body: some View {
        
        let bookmark = "bookmark"
        
        Button{
            book.readMe.toggle()
        } label : {
            Image(systemName: book.readMe ? "\(bookmark).fill" : bookmark)
                .font(.system(size: 48, weight: .light))
        }
    }
}

struct Book_Previews: PreviewProvider {
    
    static var previews: some View{
        
        VStack {
            HStack {
                BookmarkButton(book: .init())
                BookmarkButton(book: .init(readMe: false))
                Title(text: "Title", font: .title)
                Author(text: "Author", font: .title2)
            }
                Book.Image(title: Book().title)
                Book.Image(title: "")
                Book.Image(title: "📖")
            }
            .previewInAllColorSchemes
    }
}




