//
//  InstructionsView.swift
//  GGJ2024
//
//  Created by Andrea Oquendo on 27/01/24.
//

import SwiftUI

struct InstructionsView: View {
    
    @Binding var instrucao: Bool
    
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
                        instrucao = false
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
                
                Text("\"Feed the Pigeon\" é um jogo para dois jogadores, cada um controlando um botão. Os jogadores competem para clicar no botão primeiro quando a comida da rodada aparecer na tela, ganhando um ponto se acertarem e perdendo um ponto se errarem. \nO objetivo é conquistar o amor do pombo ao atingir três pontos primeiro.")
                    .lineSpacing(5)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("dogica pixel", size: 10))
                    .frame(width: 350)
            }
            .foregroundColor(.white)
            
            
        }
    }
}

//#Preview {
//    InstructionsView()
//}
