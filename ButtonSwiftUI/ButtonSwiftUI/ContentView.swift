//
//  ContentView.swift
//  ButtonSwiftUI
//
//  Created by SAIL on 18/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPressed = false
    @State private var isRotated = false
    @State private var isChanged = false
    @State private var offsetX : CGFloat = 0
    
    var body: some View {
        VStack{
            
    //MARK: Button Scale Animation (Shrink and Expand) Effect
            
        Button {
            withAnimation(.easeOut(duration: 0.2)) {
                isPressed.toggle()
            }
        } label: {
            Text("Tap Me")
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Capsule())
                .scaleEffect(isPressed ? 0.8 : 1.0)
        }

            
        //MARK: Rotation Effect
        
        Button {
            withAnimation(.spring()) {
                isRotated.toggle()
            }
        } label: {
            Image(systemName: "arrow.right.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundStyle(.blue)
                .rotationEffect(.degrees(isRotated ? 180 : 0))

        }
        .padding()
            
            //MARK: background color change Effect
            Button {
                withAnimation(.easeInOut(duration: 0.3)){
                    isChanged.toggle()
                }
            } label: {
                Text("Is Changed")
                    .padding()
                    .bold()
                    .foregroundStyle(.white)
                    .background(isChanged ? .red : .blue)
                    .clipShape(.rect(cornerRadius: 20))
            }
            
            Button{
                withAnimation(Animation.default.repeatCount(1, autoreverses: true)){
                    offsetX = 125
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    offsetX = 0
                }
            } label: {
                Text("Shake Me")
                    .padding()
                    .frame(width: 125, height: 50)
                    .foregroundStyle(.white)
                    .background(.orange)
                    .offset(x: offsetX)
                    .clipShape(.capsule)
            }
        }
        VStack {
            Text ("Hello, SwiftUI")
                .padding( )
//                .background(.red)
        }
        .background(.yellow)
        // New hotness with contentMargins
        VStack {
            Text ("Hello, SwiftUI")
            
        }
        .contentMargins(.horizontal, 50)
        .contentMargins (.vertical, 100)
        .background(.yellow)
    }
}

#Preview {
    ContentView()
}
