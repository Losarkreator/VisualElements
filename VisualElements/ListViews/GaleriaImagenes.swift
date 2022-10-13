//
//  GaleriaImagenes.swift
//  VisualElements
//
//  Created by cturrion on 9/9/22.
//

import SwiftUI

struct Icono: View {
    var iconName: String?
    var size: CGFloat?

    var body: some View {
        Image(systemName: iconName ?? "photo")
            .resizable()
            .scaledToFit()
            .frame(width: size ?? 50, height: size ?? 50)
            .padding(.leading, 10.0)
    }
}

struct Imagen: View {
    var imageName: String?
    var size: CGFloat = 150
    private var esquinasRedondeadas: CGFloat {size.self / 5}

    var body: some View {
        Image(imageName ?? "FotoBankinter")
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .cornerRadius(CGFloat(size/5))
            .padding(.leading, 10.0)
    }
}

struct GaleriaImagenes: View {
    var body: some View {
        ScrollView(.vertical) {
            Text("Imagenes")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text("SF Symbols 1")
                    .font(.headline)
                    .padding(.leading)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        // 10 Elementos máximo
                        
                        Icono()
                        Icono(iconName: "person.fill")
                        Icono(iconName: "exclamationmark.triangle")
                        Icono(iconName: "trash")
                        Icono(iconName: "paperplane")
                        Icono(iconName: "plus.magnifyingglass")
                        Icono(iconName: "house")
                        Icono(iconName: "star.fill")
                        Icono(iconName: "heart.fill")
                        Icono(iconName: "bell")
                    }
                }
            }
            .padding(.vertical)
            
            VStack(alignment: .leading) {
                Text("SF Symbols 2")
                    .font(.headline)
                    .padding(.leading)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        // 10 Elementos máximo
                        Icono(iconName: "sun.min.fill")
                        Icono(iconName: "camera.fill")
                        Icono(iconName: "phone.circle.fill")
                        Icono(iconName: "lock.fill")
                        Icono(iconName: "wifi.slash")
                        Icono(iconName: "battery.25")
                        Icono(iconName: "safari")
                        Icono(iconName: "airplane")
                        Icono(iconName: "arkit")
                        Icono(iconName: "flame.fill")
                    }
                }
            }
            .padding(.top)
            
            VStack(alignment: .leading) {
                Text("Imagenes")
                    .font(.headline)
                    .padding(.leading)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        // 10 Elementos máximo
                        Imagen(imageName: "AvatarIk")
                        Imagen(imageName: "cuervos")
                        Imagen(imageName: "cupula")
                        Imagen(imageName: "fondo")
                        Imagen()
                        Icono(iconName: "plus.circle")
                    }
                }
                .shadow(color: shadowColor, radius: 5, y: 5)
            }
            .padding(.top)
            
            
            VStack(alignment: .leading) {
                Text("Imagenes Async")
                    .font(.headline)
                    .padding(.leading)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        // 10 Elementos máximo
//                        Imagen(imageName: "AvatarIk")
                        
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png")
                        AsyncImageView(urlSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png")
                    }
                }
                .shadow(color: shadowColor, radius: 5, y: 5)
            }
            .padding(.top)
        
        }
        
    }
}

struct GaleriaImagenes_Previews: PreviewProvider {
    static var previews: some View {
        GaleriaImagenes()
    }
}


//MARK: - Notas
// Buscar Iconos: https://hotpot.ai/free-icons?s=sfSymbols
