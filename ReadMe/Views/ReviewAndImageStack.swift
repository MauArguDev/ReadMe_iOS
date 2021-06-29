//
//  ReviewAndImageStack.swift
//  ReadMe
//
//  Created by user199344 on 6/28/21.
//

import SwiftUI
import Combine
import class PhotosUI.PHPickerViewController

struct ReviewAndImageStack: View {
    
    @ObservedObject var book: Book
    @State var showImagePicker: Bool = false
    @State var showDeleteAlert: Bool = false
    @Binding var image: UIImage?
    
    var body: some View {
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
            .sheet(isPresented: $showImagePicker, content: {
                PHPickerViewController.View(image: $image)
            })
            .alert(isPresented: $showDeleteAlert, content: {
                .init(title: .init("Delete image for \(book.title)?"), primaryButton: .destructive(.init("Delete"), action:        {image = nil}),
                      secondaryButton: .cancel())
            })
        }
    }
}

struct ReviewAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImageStack(book: .init(), image: .constant(nil)).previewInAllColorSchemes
    }
}
