//
//  ColorSchemeExtension.swift
//  ReadMe
//
//  Created by user199344 on 6/27/21.
//

import SwiftUI

extension View {
  var previewInAllColorSchemes: some View {
    ForEach(
      ColorScheme.allCases, id: \.self,
      content: preferredColorScheme
    )
  }
}
