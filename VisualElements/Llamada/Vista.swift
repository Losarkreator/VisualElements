//  Vista.swift
//  VisualElements
//  Created by cturrion on 11/10/22.

import SwiftUI

struct Vista: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            
            //TODO: Poner imagen del Pokemon
            Imagen(imageName: "cuervos")
            
            //TODO: Poner nombre del Pokemon
            Text("Pokemon \(viewModel.pokemon[0].name)")
            Text("\(viewModel.thisThat.that)")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Obtener Nombre") {
                viewModel.getData()
                viewModel.getPokemonName()
            }
            .buttonStyle(CambiarColorAlPulsar())
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear(perform: viewModel.getPokemonName)
//        .onAppear(perform: viewModel.getData)
            
    }
}

struct Vista_Previews: PreviewProvider {
    static var previews: some View {
        Vista(viewModel: ViewModel())
    }
}
