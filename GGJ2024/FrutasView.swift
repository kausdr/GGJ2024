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
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            ForEach(frutasAparecer.indices, id: \.self) { index in
                ZStack {
                    Text("\(frutasAparecer[index])")
                        .font(.system(size: 50))
                        .opacity(1)
                        .offset(x: CGFloat(getX()), y: CGFloat(getY()))
                }
            }


        }
        .onAppear{
            controladorDeFrutas.embaralharFrutas()
            frutas = controladorDeFrutas.getBaralhoDeFrutas()
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
    
    func getX() -> Int {
        return Int.random(in: -300...300)
    }
    
    func getY() -> Int {
        return Int.random(in: -200...200)
    }
}

#Preview {
    FrutasView()
        .environmentObject(ControladorDeFrutas())
}


