import WidgetKit
import SwiftUI

struct ChillEntry: TimelineEntry {
    let date: Date
    let message: String
}

struct ChillProvider: TimelineProvider {
    func placeholder(in context: Context) -> ChillEntry {
        ChillEntry(date: .now, message: "Take a breath")
    }

    func getSnapshot(in context: Context, completion: @escaping (ChillEntry) -> Void) {
        completion(ChillEntry(date: .now, message: randomMessage()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ChillEntry>) -> Void) {
        let entry = ChillEntry(date: .now, message: randomMessage())
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: .now)!
        completion(Timeline(entries: [entry], policy: .after(nextUpdate)))
    }

    private func randomMessage() -> String {
        let messages = [
            "Take a breath",
            "You're doing great",
            "Relax for a moment",
            "Stay chill",
            "One step at a time",
            "It's okay to pause",
        ]
        return messages.randomElement() ?? "Stay chill"
    }
}

struct ChillButtonWidgetEntryView: View {
    var entry: ChillEntry

    var body: some View {
        VStack(spacing: 8) {
            Text("🧊")
                .font(.largeTitle)
            Text(entry.message)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

@main
struct ChillButtonWidget: Widget {
    let kind = "ChillButtonWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ChillProvider()) { entry in
            ChillButtonWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Chill Button")
        .description("A gentle reminder to stay chill.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    ChillButtonWidget()
} timeline: {
    ChillEntry(date: .now, message: "Take a breath")
    ChillEntry(date: .now, message: "Stay chill")
}
