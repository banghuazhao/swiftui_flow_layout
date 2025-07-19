//
// Created by Banghua Zhao on 20/07/2025
// Copyright Apps Bay Limited. All rights reserved.
//
  

import SwiftUI
import SwiftUIFlowLayout

struct ContentView: View {
    let tags = ["Swift", "Kotlin", "JavaScript", "Python", "Rust", "Go", "Ruby", "TypeScript", "C#", "C++", "Dart", "Scala"]
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 8) {
                        Text("SwiftUIFlowLayout")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .shadow(color: Color.black.opacity(0.08), radius: 2, x: 0, y: 2)
                        Text("Effortless, flexible, and beautiful flow layouts for SwiftUI.")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    // Card container
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Popular Languages")
                            .font(.headline)
                            .foregroundColor(.primary)
                        FlowLayout(items: tags, horizontalSpacing: 12, verticalSpacing: 12) { tag in
                            Text(tag)
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .shadow(color: Color.purple.opacity(0.15), radius: 4, x: 0, y: 2)
                        }
                        .padding(.bottom, 8)
                    }
                    .padding(28)
                    .background(.ultraThinMaterial)
                    .cornerRadius(28)
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0, y: 8)
                    .padding(.horizontal)

                    // --- Simple Example Section ---
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Minimal Usage Example")
                            .font(.headline)
                            .foregroundColor(.primary)
                        ExampleReadmeUsage()
                            .padding()
                            .background(Color(.systemBackground).opacity(0.8))
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                    }
                    .padding(.horizontal)

                    Spacer(minLength: 40)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
