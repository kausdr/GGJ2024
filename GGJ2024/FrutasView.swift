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
    
    
    
    var body: some View {
        
        
        ZStack {
//            NavigationLink(destination: WinnerView(ganhador: ganhador), isActive: $acabou) {
//                EmptyView()
//            }
            
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
                            print("jogador 1 wind")
                            player1 += 1
                            
                            if player1 >= 3 {
                                ganhador = "Vó Ana"
                                acabou = true
                            }
                            reset = true
                            print("pontos jogador 1: \(player1)")
                            
                        } else {
                            print("jogador 1 lose")
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
                            print("jogador 2 wind")
                            player2 += 1
                            
                            if player2 >= 3 {
                                ganhador = "Vó Zélia"
                                acabou = true
                            }
                            
                            reset = true
                            
                            print("pontos jogador 2: \(player2)")
                            
                        } else {
                            print("jogador 2 lose")
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
            print("mudou")
            if reset == true {
                controladorDeFrutas.setIsOn(on: false)
                frutas = []
                frutasAparecer = []
                
                controladorDeFrutas.selecionarFrutaDaRodada()
                frutaDaRodada = controladorDeFrutas.getFruta()
                
                controladorDeFrutas.embaralharFrutas()
                frutas = controladorDeFrutas.getBaralhoDeFrutas()
                
                for index in frutas.indices {
                    imageOffsets.append(CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight)))
                }
                
                reset = false
            }
        }
        .onAppear{
            controladorDeFrutas.embaralharFrutas()
            frutas = controladorDeFrutas.getBaralhoDeFrutas()
            for index in frutas.indices {
                imageOffsets.append(CGPoint(x: .random(in: (-screenWidth/2+30) ..< screenWidth/2-30), y: .random(in: (-screenHeight/2+30) ..< screenHeight/2-30)))
            }
            
            frutaDaRodada = controladorDeFrutas.getFruta()
            print(screenWidth)
        }
        
        .onReceive(timer) { _ in
            if !frutas.isEmpty && acabou == false {
                let fruta = frutas.popLast()
                
                
                    frutasAparecer.append(fruta ?? "")
                
                
                if fruta == controladorDeFrutas.getFruta(){
                    controladorDeFrutas.setIsOn(on: true)
                }
            }
        }
        
    }
}

//#Preview {
//    FrutasView()
//        .environmentObject(ControladorDeFrutas())
//}


