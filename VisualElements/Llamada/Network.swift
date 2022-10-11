//  Network.swift
//  VisualElements
//  Created by cturrion on 11/10/22.

import SwiftUI
// This that: http://itsthisforthat.com/api.php?json
// https://pokeapi.co/api/v2/pokemon/

class Network: ObservableObject {
    @Published var datos: [Datos] = []
    
    func getDatos() {
        // URL no tiene errores:
        guard let url = URL(string: "http://itsthisforthat.com/api.php?json") else {
            fatalError("La URL no funciona")
        }
        
        //Solicitar URL
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Error en la peticion: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([Datos].self, from: data)
                        self.datos = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
        
    }
    
}
