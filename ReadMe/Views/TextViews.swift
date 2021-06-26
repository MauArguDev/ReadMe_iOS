//
//  TextViews.swift
//  ReadMe
//
//  Created by user199344 on 6/26/21.
//

import SwiftUI

struct Title: View {
    let text: String
    let font: Font
    var body: some View {
        Text(text)
            .font(font)
            .bold()
    }
}

struct Author: View {
    let text: String
    let font: Font
    var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(.secondary)
            .bold()
    }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
        Title(text: "Title", font: .title2)
        Author(text: "Author", font: .title3)
    }
    .padding()
  }
}
