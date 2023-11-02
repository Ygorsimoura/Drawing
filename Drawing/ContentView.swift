//
//  ContentView.swift
//  Drawing
//
//  Created by Ygor Simoura on 31/10/23.
//

import SwiftUI

struct Flower: Shape {
    var petalOffSet = -20.0 // distancia da pétala em relação ao centro
    var petalWidth = 100.0 // largura da pétala
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {  // Conte um oitavo de pi até 360 graus
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffSet, y: 0, width: petalWidth, height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        return path
    }
    
}

struct ContentView: View {
    @State private var petalOffSet = -20.0
    @State private var petalWidth = 100.0
    var body: some View {
        VStack {
            Flower(petalOffSet: petalOffSet, petalWidth: petalWidth)
                .fill(.blue, style: FillStyle(eoFill: true))
            
        Text("Petal OffSet")
            Slider(value: $petalOffSet, in: -40...40)
                .padding([.horizontal,.bottom])
        
        Text("Petal Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
