//
//  CardView.swift
//  SwiftUI_3DPlantet
//
//  Created by piro2 on 8/30/24.
//

import SwiftUI
import Lottie
import SceneKit

struct CardView: View {
    var type: PlanetType
    
    @Binding var translation: CGSize
    @Binding var isFlipped: Bool
    
    // MARK: - View
    var body: some View {
        ZStack {
            backgroundLottie
            VStack {
                ZStack(alignment: .center) {
                    circleShadow
                    PlanetSceneView(diffuseName: type.rawValue)
                }
                .frame(height: 300)
                .offset(x: translation.width / 3, y: translation.height / 3)
                .zIndex(1)

                VStack(spacing: 4) {
                    name
                    subname
                }
                .offset(y: -50)
                
                Spacer()
                
                HStack(spacing: 16) {
                    if type == .earth {
                        navigationButton("arrowtriangle.backward.fill")
                    }
                    
                    infoButton
                    
                    if type == .earth {
                        navigationButton("arrowtriangle.forward.fill")
                    }
                }
                .frame(height: 50)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .offset(x: translation.width / 17, y: translation.height / 17)
    }
}

// MARK: - Private
private extension CardView {
    var infoButton: some View {
        Button { isFlipped.toggle() } label: {
            Text( type == .earth ? "Satellite" : "Planet")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .font(.title3)
                .fontDesign(.rounded)
        }
        .background(.black.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: .infinity))
    }
    
    var name: some View {
        Text(type.rawValue.uppercased())
            .foregroundStyle(.white)
            .font(.system(size: 60, weight: .bold, design: .rounded))
    }
    
    var subname: some View {
        Text(type.description)
            .foregroundStyle(.white)
            .font(.system(size: 18, weight: .semibold, design: .rounded))
    }
    
    var backgroundLottie: some View {
        LottieView(animation: .named("starfallAnimation"))
            .playing()
            .looping()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    var circleShadow: some View {
        Circle()
            .stroke(.black)
            .strokeBorder(lineWidth: 30)
            .blur(radius: 32)
    }
    
    func navigationButton(_ imageName: String) -> some View {
        Button {  } label: {
            Image(systemName: imageName)
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
        }
        .background(.black.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: .infinity))
    }
}
