//  Vista.swift
//  VisualElements
//  Created by cturrion on 11/10/22.

import SwiftUI

struct Vista: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            
            //TODO: Poner la misma imagen del Pokemon que se muestra
            AsyncImageView(urlSprite: viewModel.pokemonImage.front_default)
            
            Text("pokemon Image URL: ")
            Text(viewModel.pokemonImage.front_default)
            
            
            Text(viewModel.pokemon[viewModel.randomNumber].name)
            Text(viewModel.pokemon[0].url)
//            Text(viewModel.pokemon[viewModel.randomNumber].url)
            // Text("\(viewModel.thisThat.that)")
            
            Spacer()
            
            Button("Obtener Nombre") {
                viewModel.getPokemonName()
                viewModel.getPokemonSprite()
                print(viewModel.pokemonImage.front_default)
                // viewModel.getData()
            }
            .buttonStyle(CambiarColorAlPulsar())
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear(perform: viewModel.getPokemonName)
            
    }
}

struct Vista_Previews: PreviewProvider {
    static var previews: some View {
        Vista(viewModel: ViewModel())
    }
}
