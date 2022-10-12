//  OperadorTernario.swift
//  VisualElements
//  Created by cturrion on 10/10/22.

import SwiftUI

struct OperadorTernario: View {
    @State var interruptor: Bool = false
    
    private var textoBoton: String { interruptor ? "Cierto" : "Falso" }
    
    var body: some View {
        Button(action:{
            withAnimation {
                self.interruptor.toggle()
            }
        }) {
            Text(textoBoton)
                .font(.largeTitle)
        }
        
    }
}

struct OperadorTernario_Previews: PreviewProvider {
    static var previews: some View {
        OperadorTernario()
    }
}
