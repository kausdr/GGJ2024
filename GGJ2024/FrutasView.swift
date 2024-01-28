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
    
    @State private var currentPigeon: String = "pombo_normal_00"
    
    @State private var pombos_normais_index = 0
    private let pombos_normais = ["pombo_normal_00", "pombo_normal_01", "pombo_normal_00", "pombo_normal_02", "pombo_normal_00", "pombo_normal_03"]
    
    @State private var pombos_ganhador_index = 0
    private let pombos_player2 = ["pombo_coracao_direita", "pombo_coracao_baixo"]
    private let pombos_player1 = ["pombo_coracao_esquerda", "pombo_coracao_baixo"]
    
    @State private var ganhadorTemp = 1
    
    
    
    var body: some View {
    
        ZStack {
            
            Image(currentPigeon)
                .resizable()
                .frame(width:204, height: 231)
                .offset(y: 10)
            
            
            ForEach(frutasAparecer.indices, id: \.self) { index in
                ZStack {
                    Image(frutasAparecer[index])
                        .offset(
                            x: imageOffsets[index].x,
                            y: imageOffsets[index].y
                        )
                }
            }
            
            HStack{
                ZStack{
                    Image("border_left")
                        .resizable()
                        .frame(
                            maxHeight: .infinity
                        )
                        .frame(
                            width: 120
                        )
                    
                    VStack{
                        Spacer()
                        
                        Button{
                            verificarAperto(score: &player1, playerName: "Vó Ana")
                        } label: {
                            ZStack{
                           
                                Image("senhora_um")
                                    .scaleEffect(0.8)
                                ZStack{
                                    Image("botao_rosa")
                                        .scaleEffect(0.8)
                                    Image(frutaDaRodada)
                                }
                                .offset(y:83)
                            }
                            .opacity(isPaused != 0 ? 0.5 : 1)
                        }
                        
                        Spacer()
                            .frame(height:90)
                        
                        VStack(){
                            Image(player1 >= 3 ? "coracao_rosa" : "coracao_inativo")
                            Image(player1 >= 2 ? "coracao_rosa" : "coracao_inativo")
                            Image(player1 >= 1 ? "coracao_rosa" : "coracao_inativo")
                                
                        }
                        
                        Spacer()
                        
                        
                    }
                    .offset(x: 60)
                }
                
                Spacer()
                
                ZStack{
                    Image("border_left")
                        .resizable()
                        .frame(
                            maxHeight: .infinity
                        )
                        .frame(
                            width: 120
                        )
                        . scaleEffect(x: -1, y: 1)
                    
                    VStack{
                        Spacer()
                        
                        Button{
                            verificarAperto(score: &player2, playerName: "Vó Zélia")
                        } label: {
                            ZStack{
                           
                                Image("senhora_dois")
                                    .scaleEffect(0.8)
                                ZStack{
                                    Image("botao_azul")
                                        .scaleEffect(0.8)
                                    Image(frutaDaRodada)
                                }
                                .offset(y:83)
                            }
                            .opacity(isPaused != 0 ? 0.5 : 1)
                        }
                        
                        Spacer()
                            .frame(height:90)
                        
                        VStack(){
                            Image(player2 >= 3 ? "coracao_azul" : "coracao_inativo")
                            Image(player2 >= 2 ? "coracao_azul" : "coracao_inativo")
                            Image(player2 >= 1 ? "coracao_azul" : "coracao_inativo")
                                
                        }
                        
                        Spacer()
                        
                        
                    }
                    .offset(x: -60)
                }
            }
            .ignoresSafeArea()
            
            if acabou == true {
                
                
                Rectangle()
                    .fill(.black)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                
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
            controladorDeFrutas.selecionarFrutaDaRodada()
            controladorDeFrutas.embaralharFrutas()
            
            frutas = controladorDeFrutas.getBaralhoDeFrutas()
            for _ in frutas.indices {
                imageOffsets.append(CGPoint(x: .random(in: (-screenWidth/2+30) ..< screenWidth/2-30), y: .random(in: (-screenHeight/2+30) ..< screenHeight/2-30)))
            }
            
            frutaDaRodada = controladorDeFrutas.getFruta()
        }
        
        .onReceive(timer) { _ in
                  
            if isPaused == 0 {
                
                pombos_normais_index+=1
                if pombos_normais_index >= pombos_normais.count {
                    pombos_normais_index = 0
                }
                currentPigeon = pombos_normais[pombos_normais_index]
                
                
                if !frutas.isEmpty && acabou == false {
                    SoundManager.instance.playSound(sound: .ploc)
                    let fruta = frutas.popLast()
                    
                    frutasAparecer.append(fruta ?? "")
                    
                    
                    if fruta == controladorDeFrutas.getFruta(){
                        controladorDeFrutas.setIsOn(on: true)
                    }
                }
            } else {
                
                pombos_ganhador_index+=1
                if pombos_ganhador_index >= 2 {
                    pombos_ganhador_index = 0
                }
                
                if ganhador == "Vó Ana" {
                    currentPigeon = pombos_player1[pombos_ganhador_index]
                } else {
                    currentPigeon = pombos_player2[pombos_ganhador_index]
                }
                
                
                
                isPaused-=1
                
                if isPaused == 0 { reset = true }
            }
        }
        
        
        
    }
    
    private func verificarAperto(score: inout Int, playerName: String){
        if controladorDeFrutas.getIsOn() == true {
            acerto()
            score += 1
            ganhador = playerName
            
            verificarGanhador(score: score, name: playerName)
            resetarFrutas()
            isPaused = 5
            

            
        } else {
            erro()
            if score > 0 {
                score -= 1
            }
               
        }
    }
    
    private func resetarFrutas() {
        frutas = []
        frutasAparecer = []
    }
    
    private func atribuirPosicoes() {
        for _ in frutas.indices {
            imageOffsets.append(CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight)))
        }
    }
    
    private func verificarGanhador(score: Int, name: String) {
        if score >= 3 {
            ganhador = name
            acabou = true
            SoundManager.instance.stopSound(sound: .background)
        }
    }
    
    private func acerto() {
        SoundManager.instance.playSound(sound: .FrutaCerta)
    }
    
    private func erro() {
        SoundManager.instance.playSound(sound: .FrutaErrada)
    }
}

//#Preview {
//    FrutasView()
//        .environmentObject(ControladorDeFrutas())
//}


