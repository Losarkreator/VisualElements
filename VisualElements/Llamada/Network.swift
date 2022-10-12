//  Network.swift
//  VisualElements
//  Created by cturrion on 11/10/22.

import SwiftUI
// This that: http://itsthisforthat.com/api.php?json
// https://pokeapi.co/api/v2/pokemon/

// typealias indica datos dupla
// -> devuelve en forma de funcion para cumplir con @escaping
typealias completionHandler = (_ response: Datos?, _ error: Error?) -> Void

typealias pokemonCompletitionHandler = (_ response: [Pokemon]?, _ error: Error?) -> Void

class Network {
    
    let decoder = JSONDecoder()
    let session = URLSession.shared
    
    //@escaping se usa cuando quieres cambiar algo de la funcion cuando la estás llamando
    // Cuando se llama es una closure
    func getWord(completition: @escaping (String) -> Void) {
        completition("Word")
    }
    
    
    func getPokemon(completion: @escaping pokemonCompletitionHandler){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {
            fatalError("URL Error")
        }
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let response = response as? HTTPURLResponse else {return}
            if response.statusCode != 200 { return }
            
            guard let data = data else {return}
            
            DispatchQueue.main.async { [self] in
                do {
                    let decodedPokemon = try decoder.decode(PokemonResponse.self, from: data)
                    let pokemon = decodedPokemon.results
                    completion(pokemon, nil)
                } catch let error {
                    print("Error decoding: ", error)
                }
            }
        }
        dataTask.resume()
        
    }
    
    func getDatos(completion: @escaping completionHandler) {
        // URL no tiene errores:
        guard let url = URL(string: "http://itsthisforthat.com/api.php?json") else {
            fatalError("La URL no funciona")
        }
        
        //Solicitar URL
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(nil,error)
                return
            }
            
            //Para ver el status code
            guard let response = response as? HTTPURLResponse else { return }
            
            print("status code: \(response.statusCode)")
            
            if response.statusCode != 200 { return }
            
            guard let data = data else { return }
            
            
            DispatchQueue.main.async { [self] in
                do {
                    let decodedUsers = try decoder.decode(Datos.self, from: data)
                    completion(decodedUsers, nil)
                } catch let error {
                    print("Error decoding: ", error)
                }
            }
            
        }
        dataTask.resume()
        
    }
    
}
