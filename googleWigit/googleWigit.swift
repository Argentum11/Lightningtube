//
//  googleWigit.swift
//  googleWigit
//
//  Created by User16 on 2021/12/29.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 20 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct googleWigitEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    let imageNames=[
        "Dude Perfect",
        "PewDiePie",
        "Rumi",
        "Rhett & Link"
    ]
    var body: some View {
        let select=Int.random(in: 0...3)
        switch widgetFamily {
        case .systemSmall:
            Image(imageNames[select])
                .resizable()
                .scaledToFit()
        case .systemMedium:
            VStack{
                Image(imageNames[select])
                    .resizable()
                    .scaledToFit()
                Text(imageNames[select])
            }
        case .systemLarge:
            let columns=[
            GridItem(),GridItem()
            ]
            LazyVGrid(columns: columns) {
                ForEach(imageNames, id:\.self){image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                }
            }
        default:
            Text("隨機的youtuber照片")
        }
    }
}

@main
struct googleWigit: Widget {
    let kind: String = "googleWigit"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            googleWigitEntryView(entry: entry)
        }
        .configurationDisplayName("Youtuber")
        .description("跟演算法奮鬥的人們")
    }
}
