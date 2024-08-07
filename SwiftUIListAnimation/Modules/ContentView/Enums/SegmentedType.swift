//
//  SegmentedType.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/6/24.
//

import Foundation

enum SegmentedType: Int, CaseIterable {
    case allChats, channels, events
    
    var title: String {
        switch self {
        case .allChats: return "All Messages"
        case .channels: return "Channels"
        case .events: return "Events"
        }
    }
}
