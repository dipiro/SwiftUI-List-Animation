//
//  Preview.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/6/24.
//

import Foundation

struct Preview {
    static let sections: [[ChatModel]] = [ allMessages, channels, evenets ]
    
    static let allMessages: [ChatModel] = [
        .init(image: "person_1", name: "Alicia Torreaux", message: "Bob says hi", time: "15:02"),
        .init(image: "person_2", name: "Roberto", message: "Say hello to Alice", time: "15:00"),
        .init(image: "cat", name: "Funny Cats", message: "Added New Video", time: "14:38"),
        .init(image: "person_3", name: "Karen Stanford", message: "Table for four", time: "14:29"),
        .init(image: "ananas", name: "Pineapple", message: "Sup, bro", time: "14:25"),
        .init(image: "person_4", name: "Denis", message: "I got a job", time: "14:24"),
        .init(image: "dev", name: "iOS Dev", message: "Async/await", time: "14:20"),
        .init(image: "birthday", name: "Birthday Party", message: "Don't forget the gift ", time: "13:57"),
        .init(image: "job", name: "iOS Job", message: "New job", time: "13:43"),
        .init(image: "person_5", name: "Max Stanford", message: "Table for four", time: "11:29"),
    ]
    
    static let channels: [ChatModel] = [
        .init(image: "cat", name: "Funny Cats", message: "Added New Video", time: "14:38"),
        .init(image: "dev", name: "iOS Dev", message: "Async/await", time: "14:20"),
        .init(image: "job", name: "iOS Job", message: "New job", time: "13:43")
    ]
    
    static let evenets: [ChatModel] = [
        .init(image: "birthday", name: "Birthday Party", message: "Don't forget the gift ", time: "13:57"),
    ]
}
