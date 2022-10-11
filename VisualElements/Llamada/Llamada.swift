//
//  Llamada.swift
//  VisualElements
//
//  Created by cturrion on 11/10/22.
//

import SwiftUI



struct Llamada: View {
        
    @ObservedObject var viewModel = llamadaViewModel()
    var body: some View {
        VStack {
            
//            ForEach(viewModel.thisThat.indices) { index in
//                let currentModel = viewModel.thisThat[index]
            Text(viewModel.thisThat.that)
                
//            }
//            Text(network.datos[0].this)
            
        }
        .onAppear(perform: viewModel.getData)
            
    }
}

struct Llamada_Previews: PreviewProvider {
    static var previews: some View {
        Llamada(viewModel: llamadaViewModel())
    }
}
