//
//  ContentView.swift
//  HelloWorld
//
//  Created by Trey Jennings on 8/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var fall = false
    @State private var message = "Hello, world!"
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [.red, .yellow, .orange],
                center: .center,
                startRadius: 0,
                endRadius: 300
            )
            .ignoresSafeArea()
            VStack {
                Image(systemName: "figure.fall")
                    .resizable()
                    .frame(width:250, height: 250)
                    .foregroundStyle(.white)
                    .offset(y: fall ? 800 : -500) // start above screen, fall down
                    .animation(.easeIn(duration: 5), value: fall)
                Text(message)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .shadow(color: Color.red, radius: 3, x: 5)
                    .padding()
            }
        }
        .onAppear {
            // Trigger the fall once the view appears
            fall = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                message = "Goodbye cruel world"
            }
        }
    }
}
