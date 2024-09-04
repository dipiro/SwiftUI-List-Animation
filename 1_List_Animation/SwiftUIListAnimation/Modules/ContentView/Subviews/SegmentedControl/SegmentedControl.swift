//
//  SegmentedControl.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/6/24.
//

import SwiftUI

struct OrangeSegmentedControl<Item: Hashable, Content: View>: View {
    @Binding var selectedItem: Item
    
    var items: [Item]
    var selectedColor: Color = Color.blue
    var content: (Item) -> Content
    
    // MARK: - Body
    var body: some View {
        ScrollViewReader { proxy in
            scrollView {
                lazyHGrid {
                    ForEach(items, id: \.self) { item in
                        content(item)
                            .id(item)
                            .padding(.horizontal, Const.itemInnerHPadding)
                            .padding(.vertical, Const.itemInnerVPadding)
                            .background() {
                                Capsule()
                                    .foregroundStyle(selectedItem == item ? selectedColor : selectedColor.opacity(0.3))
                            }
                            .onTapGesture() {
                                withAnimation {
                                    selectedItem = item
                                }
                            }
                            .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0 : 0.8)
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.4)
                                    .blur(radius: phase.isIdentity ? 0 : 6)
                            }
                    }
                    .onChange(of: selectedItem) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            proxy.scrollTo(selectedItem, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Private
private extension OrangeSegmentedControl {
    func lazyHGrid(_ content: @escaping () -> some View) -> some View {
        LazyHGrid(rows: [GridItem(.flexible())], spacing: Const.itemSpacing) {
            content()
        }
        .padding(.horizontal)
        .padding(.top, Const.scrollVPadding)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    func scrollView(_ content: @escaping () -> some View) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            content()
        }
//        .overlay() {
//            HStack {
//                shadowView(gradients: [Color.background, .clear])
//                Spacer()
//                shadowView(gradients: [.clear, Color.background])
//            }
//        }
    }
    
    func shadowView(gradients: [Color]) -> some View {
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(colors: gradients), startPoint: .leading, endPoint: .trailing)
            )
            .frame(width: Const.scrollTPadding * Const.shadowViewMultiplier)
    }
}

// MARK: - Const
fileprivate struct Const {
    static let itemSpacing: CGFloat = 12
    static let itemInnerHPadding: CGFloat = 10
    static let itemInnerVPadding: CGFloat = 8
    
    static let scrollVPadding: CGFloat = 8
    static let scrollTPadding: CGFloat = 16
    static let shadowViewMultiplier: CGFloat = 1.5
}
