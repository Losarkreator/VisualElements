//  ModeloDeDatos.swift
//  VisualElements
//  Created by cturrion on 11/10/22.

import Foundation

class Datos: Decodable, ObservableObject {
    var this: String = ""
    var that: String = ""
}

// 1ª llamada -> Array de Pokemon
class PokemonResponse: Decodable, ObservableObject {
    var count: Int
    var next: String
    var previous: String?
    var results: [Pokemon]
}

// -> Nombre y URL para la 2ª llamada
class Pokemon: Decodable, ObservableObject {
    var name: String = ""
    var url: String = ""
}

// 2ª llamada
struct PokemonURL: Decodable {
    var sprites: FrontalSpriteURL
}

// -> URL de la IMAGEN frontal
struct FrontalSpriteURL: Decodable {
    var front_default: String = ""
}
