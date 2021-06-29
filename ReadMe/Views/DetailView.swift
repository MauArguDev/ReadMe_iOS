//
//  DetailView.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var book: Book
    @EnvironmentObject var library : Library
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            HStack (spacing: 16){
                BookmarkButton(book: book)
                VStack{
                    Title(text: book.title, font: .title).multilineTextAlignment(.leading)
                    Author(text: book.author, font: .title2).multilineTextAlignment(.leading)
                }
            }
            
            ReviewAndImageStack(book: book, image: $library.uiImages[book])
            
        }).padding(.leading).padding(.trailing)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
            .environmentObject(Library())
            .previewInAllColorSchemes
    }
}


