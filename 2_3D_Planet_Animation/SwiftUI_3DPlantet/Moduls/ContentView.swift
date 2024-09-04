//
//  ContentView.swift
//  SwiftUI_3DPlantet
//
//  Created by piro2 on 8/29/24.
//

import SwiftUI
import SceneKit
import Lottie

struct ContentView: View {
    @State private var translation: CGSize = .zero
    @State private var isDragging = false
    @State private var isFlipped = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                background
                cardBack
                cardFront
            }
        }
        .ignoresSafeArea()
        .rotation3DEffect(angle(), axis: axis())
        .gesture(
            DragGesture()
                .onChanged { gestureAction(translation: $0.translation, isDragging: true) }
                .onEnded { _ in gestureAction(translation: .zero, isDragging: false) }
        )
    }
}

// MARK: - Private
private extension ContentView {
    var background: some View {
        Image("night_sky")
    }
    
    var cardBack: some View {
        CardView(type: .moon, translation: $translation, isFlipped: $isFlipped)
            .rotation3DEffect(.degrees(isFlipped ? .zero : -90),
                              axis: (x: .zero, y: 1, z: .zero))
            .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
            .frame(width: 300, height: 450)
    }
    
    var cardFront: some View {
        CardView(type: .earth, translation: $translation, isFlipped: $isFlipped)
            .rotation3DEffect(.degrees(isFlipped ? 90 : .zero),
                              axis: (x: .zero, y: 1, z: .zero))
            .animation(isFlipped ? .linear : .linear.delay(0.35), value: isFlipped)
            .frame(width: 300, height: 450)
    }
    
    func gestureAction(translation: CGSize, isDragging: Bool) {
        withAnimation {
            self.translation = translation
            self.isDragging = isDragging
        }
    }
    
    func angle() -> Angle {
        .degrees(isDragging ? 10 : 0)
    }
    
    func axis() -> (x: CGFloat, y: CGFloat, z: CGFloat) {
        (x: -translation.height, y: translation.width, z: 0.0)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
