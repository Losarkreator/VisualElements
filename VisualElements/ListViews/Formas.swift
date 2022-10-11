//
//  Formas.swift
//  VisualElements
//
//  Created by cturrion on 9/9/22.
//

import SwiftUI

struct Formas: View {
    private let ancho: CGFloat = 250.0, alto = 100.0
    private let naranja1 = Color(#colorLiteral(red: 1, green: 0.4666666667, blue: 0.1019607843, alpha: 1)), colorFormas = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), naranja2 = Color(#colorLiteral(red: 0.9647058824, green: 0.368627451, blue: 0, alpha: 1))
    
    var body: some View {
        VStack {
            Text("Formas")
                .font(.largeTitle)
            ZStack {
                RoundedRectangle(cornerRadius: 32, style: .continuous)
                    .fill(naranja1)
                
                //Formas
                VStack(spacing: 40.0) {
                    //Fila 1 - Cuadrado + Cuadrado Redondeado
                    HStack {
                        Rectangle()
                            .fill(colorFormas)
                            .scaledToFit()
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(colorFormas)
                            .scaledToFit()
                    }
                    .frame(width: ancho, height: alto)
                    
                    //Fila 2 - Elipse + Capsula
                    HStack {
                        Ellipse()
                            .fill(colorFormas)
                            .frame(width: 100, height: 50)
                        Spacer()
                        Capsule()
                            .fill(colorFormas)
                            .frame(width: 100, height: 50)
                    }
                    .frame(width: ancho, height: alto)
                    
                    //Fila 3 - Circulo + Forma Compuesta
                    HStack {
                        Circle()
                            .fill(colorFormas)
                            .scaledToFit()
                        Spacer()
                        // Forma multiple
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(colorFormas)
                                .scaledToFit()
                            Circle()
                                .fill(naranja1)
                                .scaledToFit()
                                .frame(width: 20)
                                .offset(x: -25, y: -25)
                        }
                    }
                    .frame(width: ancho, height: alto)
                    
                   
                }
            }
            .frame(width: 320, height: 450)
//            .padding(.vertical, 50)
//            .padding(.horizontal, 20.0)
            
            Spacer()
        }
    }
}

struct Formas_Previews: PreviewProvider {
    static var previews: some View {
        Formas()
    }
}
