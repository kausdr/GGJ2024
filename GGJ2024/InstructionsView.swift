//
//  InstructionsView.swift
//  GGJ2024
//
//  Created by Andrea Oquendo on 27/01/24.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack{
            Text("Instrucoes")
                .font(.largeTitle)
            
            Text("Cada jogador deve ficar em um lado da tela e se atentar à comida que aparece no botão do seu lado, várias comidas irão aparecer perto de Kevin, e no momento que a comida da rodada aparecer, você deve ser o primeiro a clicar para ganhar um ponto. \nCaso clique e a comida não estiver na tela, você será penalizado.\n Ganha o jogador que atingir primeiro os 20 pontos. ")
                .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    InstructionsView()
}
