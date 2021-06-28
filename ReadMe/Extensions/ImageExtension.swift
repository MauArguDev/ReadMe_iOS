//
//  ImageExtension.swift
//  ReadMe
//
//  Created by user199344 on 6/27/21.
//

import SwiftUI

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
