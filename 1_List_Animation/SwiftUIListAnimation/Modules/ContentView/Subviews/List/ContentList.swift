//
//  ContentList.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/6/24.
//

import SwiftUI

struct ContentList<Item: Hashable, Label: View>: View {
    @Binding var selectedCategory: Int
    
    var items: [Item]
    var label: (Int) -> Label
    
    // MARK: - Body
    var body: some View {
        List(items.indices, id: \.self) { index in
            label(index)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .id(selectedCategory)
    }
}

// MARK: - Preview
