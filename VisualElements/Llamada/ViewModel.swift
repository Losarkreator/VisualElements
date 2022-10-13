//  llamadaViewModel.swift
//  VisualElements
//  Created by Cano Rudkin, Elliot Joseph on 11/10/22.

import Foundation

class ViewModel: ObservableObject {
//    @Published var thisThat: Datos = Datos()
    @Published var pokemon: [Pokemon] = [Pokemon()]
    @Published var pokemonImage: FrontalSpriteURL = FrontalSpriteURL()
    let network: Network = Network()
    var randomNumber = 0
    
    //    var test = ""
    //    func getPalabraTest(){ network.getWord {text in self.test = text} }
    
    func getPokemonName(){
        generateRandomNumber()
        
        network.getPokemon { [self] data, error in
            guard let response = data else {
                print(error?.localizedDescription as Any)
                return
            }
            pokemon = response
        }
    }
    
    func getPokemonSprite(){
//        viewModel.pokemon[viewModel.randomNumber].url
        network.getPokemonImage(url: pokemon) { [self] data, error in
            guard let response = data else {
                print(error?.localizedDescription as Any)
                return
            }
            pokemonImage = response
        }
    }
    
    func generateRandomNumber(){
        randomNumber = Int.random(in: 1...19)
//        print("Random Number = \(randomNumber)")
    }
    
//    func getData() {
//        network.getDatos { [self] data, error in
//            guard let response = data else {
//                print(error!.localizedDescription)
//                return
//            }
//
//            thisThat = response
//            print("complete")
//        }
//    }
    
}
