//
//  ChatModel.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/6/24.
//

import Foundation

struct ChatModel: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var name: String
    var message: String
    var time: String
    var isRead: Bool = true
}
