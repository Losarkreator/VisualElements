//  ModeloDeDatos.swift
//  VisualElements
//  Created by cturrion on 11/10/22.

import Foundation

class Datos: Decodable, ObservableObject {
    var this: String = ""
    var that: String = ""
}


class PokemonResponse: Decodable, ObservableObject {
    var count: Int
    var next: String
    var previous: String
    var results: [Pokemon]
}

struct Pokemon: Decodable {
    var name: String
    var url: String
}
