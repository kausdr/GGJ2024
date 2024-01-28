//
//  GameplayView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 27/01/24.
//

import SwiftUI

struct GameplayView: View {
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                FrutasView()
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(.blue)
            .onAppear() {
                SoundManager.instance.playLoop(sound: .background, volume: 0.5)
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
