//
//  PlanetType.swift
//  SwiftUI_3DPlantet
//
//  Created by piro2 on 8/30/24.
//

import Foundation

enum PlanetType: String {
    case earth, moon
    
    var description: String {
        switch self {
        case .earth: return "The 3rd Planet From The Sun"
        case .moon: return "The Earth's Only Satellite"
        }
    }
}
