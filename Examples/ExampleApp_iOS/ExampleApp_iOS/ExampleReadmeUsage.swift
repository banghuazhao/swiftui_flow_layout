//
// Created by Banghua Zhao on 20/07/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import SwiftUI
import SwiftUIFlowLayout

struct ExampleReadmeUsage: View {
    let tags = ["Swift", "Kotlin", "JavaScript", "Python", "Rust", "Go", "Ruby"]
    var body: some View {
        FlowLayout(items: tags, horizontalSpacing: 12, verticalSpacing: 12) { tag in
            Text(tag)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.2))
                .foregroundColor(.blue)
                .cornerRadius(8)
        }
    }
}

#Preview {
    ExampleReadmeUsage()
}
