//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct FrutasView: View {
    // View Controller
    @Environment(\.dismiss) var dismiss
    
    // Game Controler
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    // Game related
    @State var frutas : [String] = []
    @State var frutasAparecer: [String] = []
    @State var frutaDaRodada: String = "paozinho"
    @State private var isFrutaPresente = false
    
    
    @State var player1 = 0
    @State var player2 = 0
    @State private var showingOverlay = true
    @State var ganhador = ""
    
    @State var endGame = false
    
    // Screen size
    let screenWidth = UIScreen.main.bounds.width-400
    let screenHeight = UIScreen.main.bounds.height
    @State private var imageOffsets: [CGPoint] = []
    
    // Timer related
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timerAnimation = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var isPaused = 0
    
    private let defInterval = 6
    @State private var intervalBetweenRounds = 0
    
    // Animation related
    @State private var currentPigeon: String = "pombo_normal_00"
    
    @State private var pombos_normais_index = 0
    private let pombos_normais = ["pombo_normal_00", "pombo_normal_01", "pombo_normal_00", "pombo_normal_02", "pombo_normal_00", "pombo_normal_03"]
    
    @State private var pombos_ganhador_index = 0
    private let pombos_player2 = ["pombo_coracao_direita", "pombo_coracao_baixo"]
    private let pombos_player1 = ["pombo_coracao_esquerda", "pombo_coracao_baixo"]
    
    @State private var ganhadorTemp = 1
    
    // Sound related
    @State private var triggerErrorSound = false
    
    
    var body: some View {
    
        ZStack {
            
            
            Image(currentPigeon)
                .resizable()
                .frame(width:204, height: 231)
                .offset(y: 10)
//            
//            
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
                
                ZStack {
                    Image("border_left")
                        .resizable()
                        .frame(maxHeight: .infinity)
                        .frame(width: 120)
                    
                    VStack{
                        Spacer()
                        Button {
                            print("aperto 1")
                            verificarAperto(score: &player1, playerName: "Vó Ana")
                        } label: {
                            
                            VStack{
                                Image("senhora_um")
                                    .scaleEffect(0.8)
                                    .offset(y:40)
                                
                                ZStack{
                                    Image("botao_rosa")
                                        .scaleEffect(0.8)
                                    Image(frutaDaRodada)
                                }
                            }
                        }
                        
                        VStack(){
                           Image(player1 >= 3 ? "coracao_rosa" : "coracao_inativo")
                           Image(player1 >= 2 ? "coracao_rosa" : "coracao_inativo")
                           Image(player1 >= 1 ? "coracao_rosa" : "coracao_inativo")
                       }
                        
                        Spacer()
                            .frame(height:40)
                        
                        Spacer()
                    }
                    .offset(x: 60)
                }
                
                Spacer()
                
                ZStack {
                    Image("border_left")
                        .resizable()
                        .frame(maxHeight: .infinity)
                        .frame(width: 120)
                        .scaleEffect(x: -1, y: 1)
                    
                    VStack{
                        Spacer()
                        Button {
                            verificarAperto(score: &player2, playerName: "Vó Zélia")
                        } label: {
                            
                            VStack{
                                Image("senhora_dois")
                                    .scaleEffect(0.8)
                                    .offset(y:40)
                                
                                ZStack{
                                    Image("botao_azul")
                                        .scaleEffect(0.8)
                                    Image(frutaDaRodada)
                                }
                            }
                        }
                        
                        VStack(){
                           Image(player2 >= 3 ? "coracao_azul" : "coracao_inativo")
                           Image(player2 >= 2 ? "coracao_azul" : "coracao_inativo")
                           Image(player2 >= 1 ? "coracao_azul" : "coracao_inativo")
                       }
                        
                        Spacer()
                            .frame(height:40)
                        
                        Spacer()
                    }
                    .offset(x: -60)
                }
                
            }
            .ignoresSafeArea()
            
            if endGame  {
                
                
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
        .onChange(of: triggerErrorSound){
            if triggerErrorSound == true {
                SoundManager.instance.playSound(sound: .FrutaCerta)
                triggerErrorSound = false
            }
        }
        .onAppear{
            SoundManager.instance.playLoop(sound: .background, volume: 0.1)
            setupGame()
                
        }
        
        .onReceive(timer) { _ in
            
            pigeonAnimation()
            
            if intervalBetweenRounds > 0 {
                if intervalBetweenRounds == defInterval {
                    SoundManager.instance.playSound(sound: .FrutaCerta)

                }
                intervalBetweenRounds -= 1
                if intervalBetweenRounds == 0 { setupGame() }
            } else {
                
                if !frutas.isEmpty && !endGame {
                    let fruta = frutas.popLast()
                    frutasAparecer.append(fruta ?? "")
                    SoundManager.instance.playSound(sound: .ploc)

                    if fruta == frutaDaRodada {
                        isFrutaPresente = true
                    }
                    
                }
            }
                  
        }
        
        
        
    }
    
    private func setupGame() {
        // Arruma as coisas do jogo
        controladorDeFrutas.selecionarFrutaDaRodada()
        controladorDeFrutas.embaralharFrutas()
        
        // Frutas da rodada
        frutaDaRodada = controladorDeFrutas.getFruta()
        frutas = controladorDeFrutas.getBaralhoDeFrutas()
        
        // Gera os lugares
        for _ in frutas.indices {
            imageOffsets.append(CGPoint(x: .random(in: (-screenWidth/2+30) ..< screenWidth/2-30), y: .random(in: (-screenHeight/2+30) ..< screenHeight/2-30)))
        }
    }
    
    private func resetGameStatus() {
        isFrutaPresente = false
        frutas = []
        frutasAparecer = []

    }
    
    private func pigeonAnimation(){
        
        if intervalBetweenRounds == 0 {
            pombos_normais_index+=1
            if pombos_normais_index >= pombos_normais.count {
                pombos_normais_index = 0
            }
            currentPigeon = pombos_normais[pombos_normais_index]
            
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
        }
    }
    
    private func verificarAperto(score: inout Int, playerName: String){
        if isFrutaPresente {
            
            score += 1
            print("score: \(score)")
            ganhador = playerName
            
            if score >= 3 {
                endGame = true
                SoundManager.instance.stopSound(sound: .background)
            }
            
            resetGameStatus()
            intervalBetweenRounds = defInterval

            
        } else {
            triggerErrorSound = true
            if score > 0 {
                score -= 1
            }
               
        }
    }

    
    private func atribuirPosicoes() {
        for _ in frutas.indices {
            imageOffsets.append(CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight)))
        }
    }
    
}

//#Preview {
//    FrutasView()
//        .environmentObject(ControladorDeFrutas())
//}


