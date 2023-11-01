//
//  ContentView.swift
//  Drawing
//
//  Created by Ygor Simoura on 31/10/23.
//

import SwiftUI

struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAjustment
        let modifiedEnd = endAngle - rotationAjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 , startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct ContentView: View {
    @State private var angle: Double = 0
    var body: some View {
        VStack {
            Arc(startAngle: .degrees(0), endAngle: .degrees(angle), clockwise: true)
                .stroke(.red, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            .frame(width: 300, height: 300)
            
            Slider(value: $angle, in: 0...360)
                .accentColor(.red)
                .padding(80)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
