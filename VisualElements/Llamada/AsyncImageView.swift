//
//  AsyncImageView.swift
//  VisualElements
//
//  Created by cturrion on 13/10/22.
//

import SwiftUI

struct AsyncImageView: View {
    var urlSprite: String
    internal var size: CGFloat = 100
    
    var body: some View {
        AsyncImage(url: URL(string: urlSprite))
            .scaledToFill()
            .frame(width: size, height: size)
            .overlay(Capsule().stroke(.red, lineWidth: 6))
            .shadow(color: shadowColor, radius: 5, y: 5)
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.leading, 10.0)
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png")
    }
}
