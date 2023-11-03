//
//  ContentView.swift
//  Drawing
//
//  Created by Ygor Simoura on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "swiftui"
    
    var body: some View {
        NavigationStack {
         Text("Hellow world")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}
