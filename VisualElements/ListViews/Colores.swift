//
//  Colores.swift
//  VisualElements
//
//  Created by cturrion on 12/9/22.
//º

import SwiftUI

let naranja1 = Color(#colorLiteral(red: 1, green: 0.4666666667, blue: 0.1019607843, alpha: 1)), naranja2 = Color(#colorLiteral(red: 0.9647058824, green: 0.368627451, blue: 0, alpha: 1)), colorFormas = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), amarillo = Color(#colorLiteral(red: 0.9960784314, green: 0.8078431373, blue: 0.1647058824, alpha: 1)), azulClaro = Color(#colorLiteral(red: 0.6745098039, green: 0.9333333333, blue: 0.9294117647, alpha: 1)), shadowColor = Color(#colorLiteral(red: 0.003246598877, green: 6.14357341e-05, blue: 0, alpha: 0.2))
let secondaryPurple = Color(#colorLiteral(red: 0.4913192987, green: 0.4048508406, blue: 1, alpha: 1))

struct buttonRoundedColor: View {
    @Binding var colorBackground: Color
    var color: Color
    
    var body : some View {
        VStack {
            Button(action: {
                colorBackground = color
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .scaledToFill()
                    .padding([.leading, .bottom], 10)
                    .frame(width: 100, height: 100)
                    .shadow(radius: 5)
            }
        }
    }
    
}


struct Colores: View {
    @State var colorFondo: Color = .white
    
    var body: some View {
        ZStack {
            colorFondo
                .ignoresSafeArea()

            VStack {
                Text("Colores")
                    .font(.largeTitle)
                
                VStack {
                    HStack {
                        buttonRoundedColor(colorBackground: $colorFondo, color: naranja1)
                        buttonRoundedColor(colorBackground: $colorFondo, color: secondaryPurple)
                        buttonRoundedColor(colorBackground: $colorFondo, color: .black)
                    }
                    
                    HStack {
                        buttonRoundedColor(colorBackground: $colorFondo, color: amarillo)
                        buttonRoundedColor(colorBackground: $colorFondo, color: azulClaro)
                        buttonRoundedColor(colorBackground: $colorFondo, color: colorFormas)
                    }
                }
                .shadow(color: shadowColor, radius: 3, x: 5, y: 5)
                
                Spacer()
                
            }
            .frame(width: .infinity, height: .infinity)
        }
    }
}

struct Colores_Previews: PreviewProvider {
    static var previews: some View {
        Colores()
    }
}

//MARK: - Hacer todos los fondos de la aplicacion se vuelvan del color que selecciones
