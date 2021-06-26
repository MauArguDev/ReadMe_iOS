//
//  BookViews.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//

import SwiftUI

extension Book {
    struct Image: View {
        let title: String
        let imageSize: CGFloat?
        var body: some View {
            
            let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "book")
                
            symbol
                .resizable()
                .scaledToFit()
                .frame(width: imageSize, height: imageSize)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.light))
                .foregroundColor(.secondary)
        }
    }
}

struct Book_Previews: PreviewProvider {
    
    static var previews: some View{
        
        VStack {
            Book.Image(title: Book().title,imageSize: 80)
            Book.Image(title: "", imageSize: 80)
            Book.Image(title: "😎", imageSize: 80)
        }
    }
}

extension Image {
    init?(title: String){
        guard let character = title.first,
        case let symbolName = "\(character.lowercased()).square",
        UIImage(systemName: symbolName) != nil else {
            return nil
        }
        
        self.init(systemName: symbolName)
    }
    
}
