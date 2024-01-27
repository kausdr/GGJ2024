//
//  controladorDeFrutas.swift
//  GGJ2024
//
//  Created by Kauane Santana on 27/01/24.
//

import Foundation

class ControladorDeFrutas: ObservableObject {
    private var frutaDaRodada: String = ""
    private let frutas: [String] = ["🍎", "🍌", "🍊", "🍐"]
    private var baralhoDeFrutas: [String] = []
    
    
    func selecionarFrutaDaRodada () {
        frutaDaRodada = frutas.randomElement() ?? ""
        print(frutaDaRodada)
    }
    
    func embaralharFrutas () {
        baralhoDeFrutas = []
        baralhoDeFrutas = frutas.filter{ $0 != frutaDaRodada }
        baralhoDeFrutas = baralhoDeFrutas.flatMap{[$0, $0]}
        baralhoDeFrutas.append(frutaDaRodada)
        
        baralhoDeFrutas.shuffle()
        print(baralhoDeFrutas)
    }
    
    func getBaralhoDeFrutas() -> [String] {
        return baralhoDeFrutas
    }
    
    func getFruta() -> String {
        return frutaDaRodada
    }
}
