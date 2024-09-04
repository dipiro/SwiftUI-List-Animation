//
//  PlanetSceneView.swift
//  SwiftUI_3DPlantet
//
//  Created by piro2 on 8/29/24.
//

import SwiftUI
import SceneKit
import UIKit

struct PlanetSceneView: UIViewRepresentable {
    var diffuseName: String
    
    func makeUIView(context: Context) -> SCNView {
        let scene = SCNScene()
        scene.rootNode.addChildNode(.init(geometry: createSphere()))
        scene.rootNode.runAction(rotationAnimation())
        
        var view = SCNView()
        view.scene = scene
        viewConfigure(for: &view)
    
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
    
    func rotationAnimation() -> SCNAction {
        let rotateAction = SCNAction.rotateBy(x: 0, y: -1, z: 0, duration: 4.0)
        let repeatAction = SCNAction.repeatForever(rotateAction)
        
        return repeatAction
    }
    
    func createSphere() -> SCNSphere {
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "\(diffuseName).jpg")

        let geometry = SCNSphere()
        geometry.materials.removeAll()
        geometry.materials = [material]
        
        return geometry
    }
    
    func viewConfigure(for view: inout SCNView) {
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.backgroundColor = .clear
    }
}
