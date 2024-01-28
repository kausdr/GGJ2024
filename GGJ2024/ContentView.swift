//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var creditos: Bool = false
    @State var instrucao: Bool = false
    @State private var botaoJogar = false
    
    var body: some View {
        NavigationStack{
            
            NavigationLink(destination: GameplayView(), isActive: $botaoJogar) {
                EmptyView()
            }
            
            ZStack{
                
                BackgroundView()
                
                HStack(alignment: .bottom){
                    VStack{
                        Image("logo_pigeon")
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top, 60)
                .padding(.horizontal, 55)
                    
                
                Image("pombo_inicio")
                    .resizable()
                    .frame(width:274, height: 301)
                    .offset(x: -20,y: 15)
                
                HStack{
                    
                    Spacer()
                    
                    VStack(spacing: 20){
                        
                        Button {
                            SoundManager.instance.playSound(sound: .botao1Menu)
                            botaoJogar = true
                        } label: {
                            Image("botao_jogar")
                        }
                        
                        Button {
                            instrucao = true
                        } label: {
                            Image("botao_instrucoes")
                        }
                        
                        Button {
                            creditos = true
                        } label: {
                            Image("botao_creditos")
                        }
                    }
                }
                .padding(.horizontal, 55)
            }
        }
        .overlay {
            if creditos {
                CreditsView(creditos: $creditos)
            }
            
            if instrucao {
                InstructionsView(instrucao: $instrucao)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
