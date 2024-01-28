//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                BackgroundView()
                
                HStack{
                    
                    Spacer()
                    
                    VStack(spacing: 20){
                        NavigationLink(destination: GameplayView()){
                            Image("botao_jogar")
                        }
                        
                        NavigationLink(destination: InstructionsView()){
                            Image("botao_instrucoes")
                        }
                        
                        NavigationLink(destination: CreditsView()){
                            Image("botao_creditos")
                        }
                    }
                }
                .padding(.horizontal, 55)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
