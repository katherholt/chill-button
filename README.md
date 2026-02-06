# Chill Button

An iOS widget that serves up gentle reminders to stay chill.

## Project Structure

```
ChillButton/
├── ChillButtonApp/          # Host app (required for widget)
│   ├── ChillButtonApp.swift
│   └── ContentView.swift
├── ChillButtonWidget/       # WidgetKit extension
│   └── ChillButtonWidget.swift
└── Assets.xcassets/         # Shared asset catalog
```

## Setup

### Prerequisites

- Xcode 15+ (with iOS 17 SDK)
- An Apple Developer account (for on-device testing)

### Creating the Xcode Project

The source files are ready — you just need to create the Xcode project to tie them together:

1. Open Xcode → **File > New > Project**
2. Choose **iOS > App**, click Next
3. Set:
   - Product Name: `ChillButton`
   - Interface: **SwiftUI**
   - Language: **Swift**
4. Save it inside this repo's root directory
5. **Add the widget extension**: File > New > Target > **Widget Extension**
   - Name it `ChillButtonWidget`
   - Uncheck "Include Configuration App Intent" (we use `StaticConfiguration`)
6. Replace the generated source files with the ones in this repo

### Building

- Select the `ChillButtonWidget` scheme to preview the widget
- Select the `ChillButton` scheme to run the host app
- Use **⌘B** to build, **⌘R** to run in the simulator

## How It Works

The widget displays a random chill message and refreshes every hour. The host app has a simple button that cycles through the same messages.
