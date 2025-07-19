//
//  FlowLayout.swift
//  SwiftUIFlowLayout
//
//  Created by Banghua Zhao on 18/07/2025
//  Copyright Apps Bay Limited. All rights reserved.
//

import SwiftUI

/// A flexible layout that arranges its children in a flow, wrapping to new lines as needed.
public struct FlowLayout<Content: View, Item: Hashable>: View {
    public let items: [Item]
    public let horizontalSpacing: CGFloat
    public let verticalSpacing: CGFloat
    public let content: (Item) -> Content

    // Height of the entire layout, measured via preference key
    @State private var totalHeight: CGFloat = .zero

    /// Creates a FlowLayout
    /// - Parameters:
    ///   - items: The data items to display.
    ///   - horizontalSpacing: Horizontal spacing between items.
    ///   - verticalSpacing: Vertical spacing between lines.
    ///   - content: View builder for each item.
    public init(
        items: [Item],
        horizontalSpacing: CGFloat = 8,
        verticalSpacing: CGFloat = 8,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content
    }

    public var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }

    /// Generates the flow layout content.
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = 0
        var height: CGFloat = 0
        return ZStack(alignment: .topLeading) {
            ForEach(items, id: \.self) { item in
                content(item)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= d.height + horizontalSpacing
                        }
                        let result = width
                        if item == items.last! {
                            width = 0 // Last item
                        } else {
                            width -= d.width + verticalSpacing
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if item == items.last! {
                            height = 0 // Last item
                        }
                        return result
                    })
            }
        }
        .background(HeightReader(totalHeight: $totalHeight))
    }
}

/// A helper view to read the height of the layout.
private struct HeightReader: View {
    @Binding var totalHeight: CGFloat
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewHeightKey.self, value: geometry.size.height)
        }
        .onPreferenceChange(ViewHeightKey.self) { self.totalHeight = $0 }
    }
}

private struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
} 
