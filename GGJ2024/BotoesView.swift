//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct BotoesView: View {
    
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    @State var frutaDaRodada: String = ""
    
    var body: some View {
        HStack {
            Button{
                if controladorDeFrutas.getIsOn() == true {
                    print("jogador 1 wind")
                } else {
                    print("jogador 1 lose")
                }
            } label: {
                Text(frutaDaRodada)
            }
            .frame(width: 100, height: 100)
            .background(.red)
            .cornerRadius(50)
            
            Spacer()
            
            Button{
                if controladorDeFrutas.getIsOn() == true {
                    print("jogador 2 wind")
                } else {
                    print("jogador 2 lose")
                }
            } label: {
                Text(frutaDaRodada)
            }
            .frame(width: 100, height: 100)
            .background(.red)
            .cornerRadius(50)
            
        }
        .onAppear{
            frutaDaRodada = controladorDeFrutas.getFruta()
        }
    }
}

#Preview {
    BotoesView()
        .environmentObject(ControladorDeFrutas())
}
