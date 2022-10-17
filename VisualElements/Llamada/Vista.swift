//  Vista.swift
//  VisualElements
//  Created by cturrion on 11/10/22.

import SwiftUI

struct Vista: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            
            AsyncImageView(urlSprite: viewModel.pokemonImage.front_default)
            
            Text(viewModel.pokemon[viewModel.randomNumber].name.capitalized)
            
            Button("Obtener Pokemon") {
                viewModel.getPokemonName()
                print(viewModel.pokemonImage.front_default)
            }
            .buttonStyle(CambiarColorAlPulsar())
            
            Spacer()
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear{
            getPokemon()
        }
        
    }
    
    private func getPokemon() {
            viewModel.getPokemonName()
    }
}

struct Vista_Previews: PreviewProvider {
    static var previews: some View {
        Vista(viewModel: ViewModel())
    }
}
