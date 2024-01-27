//
//  GameplayView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 27/01/24.
//

import SwiftUI

struct GameplayView: View {
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    @Binding var path: [Int]
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                FrutasView(path:$path)
            }
            .background(.blue)
            .onAppear() {
                controladorDeFrutas.selecionarFrutaDaRodada()
                controladorDeFrutas.embaralharFrutas()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    GameplayView()
//        .environmentObject(ControladorDeFrutas())
//}
