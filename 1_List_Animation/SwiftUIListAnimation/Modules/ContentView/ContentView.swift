//
//  ContentView.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShown: Bool = false
    @State private var selectedCategory = 0
    @State private var isSlideRight = true
    @State private var currentSegmentedType: SegmentedType = .allChats
    
    private var currentSection: [ChatModel] {
        Preview.sections[selectedCategory]
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                segmentedControl
                button
            }
            .padding(.horizontal)
            contentList
        }
        .onChange(of: currentSegmentedType) { oldType, newType in
            withAnimation {
                selectedCategory = newType.rawValue
                isSlideRight = newType.rawValue > oldType.rawValue ? false : true
            }
        }
    }
}

// MARK: - Private
private extension ContentView {
    var segmentedControl: some View {
        OrangeSegmentedControl(selectedItem: $currentSegmentedType,
                               items: SegmentedType.allCases) { type in
            Text(type.title)
        }
    }
    
    var contentList: some View {
        ContentList(selectedCategory: $selectedCategory, items: currentSection) { index in
            ContentCell(chat: currentSection[index])
                .appearingDownUp(isShown: $isShown, index: index)
        }
        .appearingLeftRight(isSlideRight: $isSlideRight)
        .refreshable { refreshList() }
    }
    
    var button: some View {
        Button { isShown.toggle() } label: {
            Text(isShown ? "Hide" : "Show")
        }
    }
    
    func refreshList() {
        Task {
            isShown = false
            try await Task.sleep(seconds: 1.5)
            isShown = true
        }
    }
    
}

// MARK: - Preview
#Preview {
    ContentView()
}
