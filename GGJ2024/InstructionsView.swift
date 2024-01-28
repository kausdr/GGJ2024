//
//  InstructionsView.swift
//  GGJ2024
//
//  Created by Andrea Oquendo on 27/01/24.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            ZStack {
                Image("insBg")
                VStack {
                    Button {
                        
                    } label: {
                        Image("x")
                    }
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: 384, maxHeight: 208, alignment: .trailing)
            }
            
            
            
            VStack (spacing: 10){
                
                Text("Instruções")
                    .font(Font.custom("dogica pixel", size: 14)).bold()
                
                Text("Cada jogador deve ficar em um lado da tela e se atentar à comida que aparece no botão do seu lado, várias comidas irão aparecer perto de Kevin, e no momento que a comida da rodada aparecer, você deve ser o primeiro a clicar para ganhar um ponto. \nCaso clique e a comida não estiver na tela, você será penalizado.\n Ganha o jogador que atingir primeiro os 3 pontos.")
                    .lineSpacing(5)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("dogica pixel", size: 10))
                    .frame(width: 350)
            }
            .foregroundColor(.white)
            
            
        }
    }
}

#Preview {
    InstructionsView()
}
