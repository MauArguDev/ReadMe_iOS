//
//  DetailView.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            Title(text: book.title, font: .title).multilineTextAlignment(.leading)
            Author(text: book.author, font: .title2).multilineTextAlignment(.leading)
            Book.Image(title: book.title, imageSize: nil)
            Spacer()
        }).padding(.leading).padding(.trailing)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
    }
}
