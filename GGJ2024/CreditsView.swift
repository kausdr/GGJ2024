//
//  CreditsView.swift
//  GGJ2024
//
//  Created by Andrea Oquendo on 27/01/24.
//

import SwiftUI

struct CreditsView: View {
    @Binding var creditos: Bool
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            ZStack {
                Image("creditosBg")
                VStack {
                    Button {
                        creditos = false
                    } label: {
                        Image("x")
                    }
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: 384, maxHeight: 208, alignment: .trailing)
            }
            
            
            
            VStack {
                Spacer()
                
                Text("Créditos")
                    .font(Font.custom("dogica pixel", size: 14))
                    .fontWeight(.bold)
                Spacer()
                
                
                VStack {
                    Text("feed the pigeon").font(Font.custom("dogica pixel", size: 12)).bold() + Text(" é um jogo desenvolvido por:").font(Font.custom("dogica pixel", size: 12))
                    
                    
                }
                .frame(width:250)
                .lineSpacing(10)
                
                Spacer()
                
                VStack (spacing: 4){
                    Text("kau | github: kausdr")
                        .font(Font.custom("dogica pixel", size: 10))
                    Text("andi | github: andreaoquendo")
                        .font(Font.custom("dogica pixel", size: 10))
                    Text("mari | X: @nallapng")
                        .font(Font.custom("dogica pixel", size: 10))
                }
                Spacer()
            }
            .frame(width:280, height: 208)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            
            
        }
    }
}

//#Preview {
//    CreditsView()
//}
