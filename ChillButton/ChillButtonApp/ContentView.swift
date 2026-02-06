import SwiftUI

struct ContentView: View {
    @State private var message = "Tap the button"

    private let messages = [
        "Take a breath",
        "You're doing great",
        "Relax for a moment",
        "Stay chill",
        "One step at a time",
        "It's okay to pause",
    ]

    var body: some View {
        VStack(spacing: 24) {
            Text(message)
                .font(.title)
                .multilineTextAlignment(.center)
                .animation(.easeInOut, value: message)

            Button(action: {
                message = messages.randomElement() ?? "Stay chill"
            }) {
                Text("🧊 Chill")
                    .font(.title2)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
            }
            .buttonStyle(.borderedProminent)
            .tint(.cyan)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
