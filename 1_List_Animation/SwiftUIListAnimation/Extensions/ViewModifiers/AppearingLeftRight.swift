//
//  AppearingLeftRight.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/7/24.
//

import SwiftUI

struct AppearingLeftRight: ViewModifier {
    @Binding var isSlideRight: Bool
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .transition(.asymmetric(insertion: .move(edge: isSlideRight ? .leading : .trailing),
                                    removal: .move(edge: isSlideRight ? .trailing : .leading)))
    }
}

extension View {
    func appearingLeftRight(isSlideRight: Binding<Bool>) -> some View {
        self.modifier(AppearingLeftRight(isSlideRight: isSlideRight))
    }
}
