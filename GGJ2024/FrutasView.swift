//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct FrutasView: View {
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    @State var frutas : [String] = []
    @State var frutasAparecer: [String] = []
    
    @State private var imageOffsets: [CGPoint] = []
    @State private var showingOverlay = true
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            ForEach(frutasAparecer.indices, id: \.self) { index in
                ZStack {
                    Text("\(frutasAparecer[index])")
                        .font(.system(size: 50))
                        .opacity(1)
                        .position(
                            x: imageOffsets[index].x,
                            y: imageOffsets[index].y
                        )
                }
            }
            
            
        }
        .onChange(of: controladorDeFrutas.resetTime){
            print("mudou")
            if controladorDeFrutas.resetTime == true {
                frutas = []
                frutasAparecer = []
//                controladorDeFrutas.selecionarFrutaDaRodada()
//                controladorDeFrutas.embaralharFrutas()
//                frutas = controladorDeFrutas.getBaralhoDeFrutas()
//                for index in frutas.indices {
//                    imageOffsets.append(CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight)))
//                }
                
                
            }
        }
        .onAppear{
            controladorDeFrutas.embaralharFrutas()
            frutas = controladorDeFrutas.getBaralhoDeFrutas()
            for index in frutas.indices {
                imageOffsets.append(CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight)))
            }
        }
        
        .onReceive(timer) { _ in
            
            let fruta = frutas.popLast()
            
            if !frutas.isEmpty {
                frutasAparecer.append(fruta ?? "")
            }
            
            if fruta == controladorDeFrutas.getFruta(){
                controladorDeFrutas.setIsOn(on: true)
            }
        }
        
    }
}

#Preview {
    FrutasView()
        .environmentObject(ControladorDeFrutas())
}


