//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    var body: some View {
        ZStack {
            BackgroundView()
            FrutasView()
        }
        .background(.blue)
        .onAppear() {
            controladorDeFrutas.selecionarFrutaDaRodada()
            controladorDeFrutas.embaralharFrutas()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ControladorDeFrutas())
}
