//
//  Modifiers.swift
//  designcode
//
//  Created by jesper kristiansen on 2/5/20.
//  Copyright © 2020 jesper kristiansen. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(self.style, design: .rounded))
    }
}

// fonts.google.com
// https://designcode.io/swiftui2-custom-fonts-and-modifiers

struct CustomFontModifier: ViewModifier {
    var size: CGFloat = 28
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Armata-Regular", size: size))
    }
}
