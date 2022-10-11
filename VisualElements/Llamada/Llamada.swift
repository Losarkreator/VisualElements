//
//  Llamada.swift
//  VisualElements
//
//  Created by cturrion on 11/10/22.
//

import SwiftUI



struct Llamada: View {
    @ObservedObject var network: Network = Network()
    
    
    var body: some View {
        VStack {
            Text("HI")
//            Text(network.datos[0].this)
            
        }
        .onAppear(perform: network.getDatos)
            
    }
}

struct Llamada_Previews: PreviewProvider {
    static var previews: some View {
        Llamada(network: Network())
    }
}
