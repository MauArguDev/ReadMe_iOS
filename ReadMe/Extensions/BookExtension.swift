//
//  BookExtension.swift
//  ReadMe
//
//  Created by user199344 on 6/27/21.
//

import SwiftUI

extension Book {
    struct Image: View {
        let uiImage: UIImage?
        let title: String
        let imageSize: CGFloat?
        let cornerRadius: CGFloat
        var body: some View {
            
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(cornerRadius)
            } else {
                let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "book")
                    
                symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .font(.title.weight(.light))
                    .foregroundColor(.secondary)

            }
        }
    }
}

extension Book.Image {
    init(title: String){
        self.init(
            uiImage: nil,
            title: title,
            imageSize: nil,
            cornerRadius: .init()
        )
    }
}
