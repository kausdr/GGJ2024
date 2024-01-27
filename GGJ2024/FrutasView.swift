//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct FrutasView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    @State var frutas : [String] = []
    @State var frutasAparecer: [String] = []
    
    @State private var imageOffsets: [CGPoint] = []
    @State private var showingOverlay = true
    
    let screenWidth = UIScreen.main.bounds.width-400
    let screenHeight = UIScreen.main.bounds.height
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var frutaDaRodada: String = ""
    @State var reset = false
    
    @State var player1 = 0
    @State var player2 = 0
    
    @State var acabou = false
    @State var ganhador = ""
    
    @State private var isPaused = 0
    
    
    var body: some View {
        
        
        ZStack {
            
            ForEach(frutasAparecer.indices, id: \.self) { index in
                ZStack {
                    Text("\(frutasAparecer[index])")
                        .font(.system(size: 50))
                        .opacity(1)
                        .offset(
                            x: imageOffsets[index].x,
                            y: imageOffsets[index].y
                        )
                }
            }
            
            HStack {
                
                VStack {
                    Text("Player 1: \(player1)")
                        .background(.red)
                    Spacer()
                    Button{
                        if controladorDeFrutas.getIsOn() == true {
                            player1 += 1
                            
                            verificarGanhador(score: player1, name: "Vó Ana")
                            resetarFrutas()
                            isPaused = 3
        
                            
                        } else {
                        if player1 > 0 {
                            player1 -= 1
                        }
                            
                            
                        }
                    } label: {
                        Text(frutaDaRodada)
                            .font(.system(size: 50))
                            .frame(width: 100, height: 100)
                            .background(.red)
                            .cornerRadius(50)
                            .opacity(isPaused != 0 ? 0.5 : 1)
                    }
                    Spacer()
                }
                
                
                Spacer()
                
                VStack {
                    Text("Player 2: \(player2)")
                        .background(.red)
                    Spacer()
                    Button{
                        if controladorDeFrutas.getIsOn() == true {
                            player2 += 1
                            
                            verificarGanhador(score: player1, name: "Vó Zélia")
                            resetarFrutas()
                            isPaused = 3
                            
                            
                        } else {
                            if player2 > 0 {
                                player2 -= 1
                            }
                        }
                    } label: {
                        Text(frutaDaRodada)
                            .font(.system(size: 50))
                            .frame(width: 100, height: 100)
                            .background(.red)
                            .cornerRadius(50)
                            .opacity(isPaused != 0 ? 0.5 : 1)
                    }
                    Spacer()
                }
                         
            }
            
            Rectangle()
                .fill(.black)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .ignoresSafeArea()
                .opacity(acabou == true ? 0.5 : 0)
            
            
            if acabou == true {
                VStack{
                    Text("\(ganhador) ganhou!!! ihulll")
                    Button{
                        dismiss()
                    } label: {
                        Text("Voltar ao inicio")
                    }
                }
                .padding(40)
                .background(.red)
                .cornerRadius(30)
            }
        }
        .onChange(of: reset){
            
            if reset == true && isPaused == 0 {
                controladorDeFrutas.setIsOn(on: false)
                
                controladorDeFrutas.selecionarFrutaDaRodada()
                frutaDaRodada = controladorDeFrutas.getFruta()
                
                controladorDeFrutas.embaralharFrutas()
                frutas = controladorDeFrutas.getBaralhoDeFrutas()
                
                atribuirPosicoes()
                
                reset.toggle()
            }
            
        }
        .onAppear{
            controladorDeFrutas.embaralharFrutas()
            frutas = controladorDeFrutas.getBaralhoDeFrutas()
            for index in frutas.indices {
                imageOffsets.append(CGPoint(x: .random(in: (-screenWidth/2+30) ..< screenWidth/2-30), y: .random(in: (-screenHeight/2+30) ..< screenHeight/2-30)))
            }
            
            frutaDaRodada = controladorDeFrutas.getFruta()
        }
        
        .onReceive(timer) { _ in
            
            if isPaused == 0 {
                if !frutas.isEmpty && acabou == false {
                    let fruta = frutas.popLast()
                    
                    frutasAparecer.append(fruta ?? "")
                    
                    
                    if fruta == controladorDeFrutas.getFruta(){
                        controladorDeFrutas.setIsOn(on: true)
                    }
                }
            } else {
                isPaused-=1
                
                if isPaused == 0 { reset = true }
            }
        }
        
        
        
    }
    
    private func resetarFrutas() {
        frutas = []
        frutasAparecer = []
    }
    
    private func atribuirPosicoes() {
        for index in frutas.indices {
            imageOffsets.append(CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight)))
        }
    }
    
    private func verificarGanhador(score: Int, name: String) {
        if score >= 3 {
            ganhador = name
            acabou = true
        }
    }
}

//#Preview {
//    FrutasView()
//        .environmentObject(ControladorDeFrutas())
//}


