//
//  AppearingDownUp.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/5/24.
//

import SwiftUI

struct AppearingDownUp: ViewModifier {
    @Binding var isShown: Bool
    var index: Int

    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .offset(y: isShown ? .zero : yOffset())
            .opacity(isShown ? 1 : .zero)
            .scaleEffect(isShown ? 1 : 0.5, anchor: .bottom)
            .animation(.linear(duration: animationDuration()), value: isShown)
    }
}

// MARK: - Private
private extension AppearingDownUp {
    func yOffset() -> CGFloat {
        if index == 0 {
            Const.yOffset
        } else if index == Const.limitMax {
            CGFloat.zero
        } else {
            CGFloat(index) * Const.yOffset
        }
    }
    
    func animationDuration() -> CGFloat {
        if index == 0 {
            Const.animationDuration / 2
        } else if index == Const.limitMax {
            CGFloat.zero
        } else {
            Double(index) * Const.animationDuration
        }
    }
}

// MARK: - Extension
extension View {
    func appearingDownUp(isShown: Binding<Bool>, index: Int) -> some View {
        self.modifier(AppearingDownUp(isShown: isShown, index: index))
    }
}


// MARK: - Const
fileprivate struct Const {
    static let yOffset: CGFloat = 90
    static let animationDuration: CGFloat = 0.15
    static let limitMax: Int = 8
}
