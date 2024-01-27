//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct FrutasView: View {
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    @State private var imageOffsets: [CGPoint] = Array(repeating: CGPoint.zero, count: 3)
        @State private var showingOverlay = true
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
    
    var frutas: [String] = ["🍎", "🍌", "🍊", "🍐"]
    var body: some View {
//        ZStack {
//            Text("🍎")
//                .offset(x:-150, y:0)
//            Text("🍌")
//                .offset(x:-100, y:0)
//            Text("🍊")
//                .offset(x:-50, y:0)
//            Text("🍐")
//                .offset(x:0, y:0)
//            Text("🍌")
//                .offset(x:50, y:0)
//            Text("🍊")
//                .offset(x:100, y:0)
//            Text("🍐")
//                .offset(x:150, y:0)
//            
//        }
        
        ZStack {
                        Text("🍐")
                            .position(
                                x: imageOffsets[0].x,
                                y: imageOffsets[0].y
                            )
                        
                        Text("🍎")
                            .position(
                                x: imageOffsets[1].x,
                                y: imageOffsets[1].y
                            )
                        Text("🍌")
                            .position(
                                x: imageOffsets[2].x,
                                y: imageOffsets[2].y
                            )
                }
                .ignoresSafeArea()
                .onAppear {
                    for index in 0..<3 {
                        imageOffsets[index] = CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight))
                    }
                }
//                .overlay {
//                    if showingOverlay {
//                        OverlayView(imageOffsets: imageOffsets)
//                    }
//                }
            }
        
    }

//struct OverlayView: View {
//    let imageOffsets: [CGPoint]
//    
//    var body: some View {
//        ZStack {
//            Color.clear
//            ForEach(0..<1) { index in
//                Circle()
//                    .stroke(.blue)
//                    .frame(width: 40, height: 40)
//                    .position(
//                        x: imageOffsets[index].x,
//                        y: imageOffsets[index].y
//                    )
//            }
//        }
//        .ignoresSafeArea()
//    }
//}

#Preview {
    FrutasView()
        .environmentObject(ControladorDeFrutas())
}


