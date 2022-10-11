//
//  llamadaViewModel.swift
//  VisualElements
//
//  Created by Cano Rudkin, Elliot Joseph on 11/10/22.
//

import Foundation


class llamadaViewModel: ObservableObject {
    @Published var thisThat: Datos = Datos()
    let network: Network = Network()

    
    func getData() {
        network.getDatos { [self] data, error in
            guard let response = data else {
                print(error?.localizedDescription)
                return
                
            }
            thisThat = response
            print("complete")
        }
    }
    
    
}
