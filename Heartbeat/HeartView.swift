//
//  HeartView.swift
//  Heartbeat
//
//  Created by Yaroslav Malygin on 15.02.2025.
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            Path { path in
                path.move(to: CGPoint(x: width / 2, y: height))
                
                path.addCurve(
                    to: CGPoint(x: 0, y: height / 3),
                    control1: CGPoint(x: width * 0.2, y: height * 0.9),
                    control2: CGPoint(x: 0, y: height * 0.6)
                )
                
                path.addArc(
                    center: CGPoint(x: width * 0.25, y: height * 0.2),
                    radius: width * 0.25,
                    startAngle: .degrees(180),
                    endAngle: .degrees(0),
                    clockwise: false
                )
                
                path.addArc(
                    center: CGPoint(x: width * 0.75, y: height * 0.2),
                    radius: width * 0.25,
                    startAngle: .degrees(180),
                    endAngle: .degrees(0),
                    clockwise: false
                )
                
                path.addCurve(
                    to: CGPoint(x: width / 2, y: height),
                    control1: CGPoint(x: width, y: height * 0.6),
                    control2: CGPoint(x: width * 0.8, y: height * 0.9)
                )
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.red, Color.pink]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .shadow(color: .red.opacity(0.7), radius: 15)
        }
        .frame(width: 150, height: 150)
    }
}

struct AnimatedHeartView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            HeartView()
                .scaleEffect(isAnimating ? 1.15 : 1.0)
                .animation(
                    Animation
                        .easeInOut(duration: 0.8)
                        .repeatForever(autoreverses: true),
                    value: isAnimating
                )
        }
        .onAppear {
            isAnimating.toggle()
        }
    }
}

#Preview {
    AnimatedHeartView()
}
