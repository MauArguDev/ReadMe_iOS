//
//  DetailView.swift
//  ReadMe
//
//  Created by user199344 on 6/25/21.
//
import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    
    @ObservedObject var book: Book
    @State var showImagePicker: Bool = false
    @State var showDeleteAlert: Bool = false
    @Binding var image: UIImage?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            HStack (spacing: 16){
                BookmarkButton(book: book)
                VStack{
                    Title(text: book.title, font: .title).multilineTextAlignment(.leading)
                    Author(text: book.author, font: .title2).multilineTextAlignment(.leading)
                }
            }
            
            VStack {
                Divider()
                    .padding(.vertical)
                TextField("Review...", text: $book.microReview)
                Divider()
                    .padding(.vertical)
                Book.Image(uiImage: image, title: book.title, imageSize: nil, cornerRadius: 16).scaledToFit()
                HStack(spacing: 5){
                    Spacer()
                    Button("Update Image")
                    {
                        showImagePicker = true
                        
                    }.padding()
                    Spacer()
                    if image != nil {
                        Button("Delete Image")
                        {
                            showDeleteAlert = true
                        }.padding()
                        Spacer()
                    }
                }
            }
            Spacer()
        }).padding(.leading).padding(.trailing)
        .sheet(isPresented: $showImagePicker, content: {
            PHPickerViewController.View(image: $image)
        })
        .alert(isPresented: $showDeleteAlert, content: {
            .init(title: .init("Delete image for \(book.title)?"), primaryButton: .destructive(.init("Delete"), action:        {image = nil}),
                  secondaryButton: .cancel())
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
            .previewInAllColorSchemes
    }
}
