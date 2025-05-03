# FilmCreditsView

A film-inspired credits view for iOS applications. This package provides a beautiful, customizable way to show credits and acknowledgments in your app, similar to how movie credits roll.

## Features

- Auto-scrolling animation resembling film credits
- Play/pause controls with adjustable speed
- Customizable sections and formatting
- Fade in/out effects at top and bottom
- Hierarchical organization of contributors with different visual treatments

## Requirements

- iOS 15.0+ / macOS 12.0+
- Swift 5.7+
- Xcode 14.0+

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/yourusername/FilmCreditsView.git", from: "1.0.0")
```

Or add it directly in Xcode:
1. Go to File > Add Packages...
2. Enter the package repository URL
3. Choose the version rule (usually "Up to Next Major" is recommended)

## Usage

```swift
import FilmCreditsView
import SwiftUI

struct ContentView: View {
    // Create your credits data
    let appCredits = CreditData(
        appName: "My Amazing App",
        version: "1.0",
        releaseDate: "May 2025",
        sections: [
            CreditSection(
                title: "Created By",
                items: [
                    CreditItem(name: "Your Name", role: "Creator & Developer")
                ],
                fontSize: 32,
                spacing: 20
            ),
            CreditSection(
                title: "Special Thanks",
                items: [
                    CreditItem(name: "Jane Smith", role: "Feature Ideas"),
                    CreditItem(name: "John Doe", role: "Beta Testing")
                ],
                fontSize: 20,
                spacing: 12
            )
        ],
        copyright: "© 2025 Your Company. All Rights Reserved.",
        website: "www.yourwebsite.com"
    )
    
    var body: some View {
        FilmCreditsView(credits: appCredits)
    }
}
```

You can show the credits view modally:

```swift
struct SettingsView: View {
    @State private var showCredits = false
    
    var body: some View {
        Form {
            // Other settings...
            
            Button("Show Credits") {
                showCredits = true
            }
        }
        .sheet(isPresented: $showCredits) {
            FilmCreditsView(credits: CreditData.sample())
        }
    }
}
```

## Customization

The package provides several ways to customize the appearance:

- Different font sizes per section
- Custom spacing between items
- Adjustable scrolling speed
- Section organization with hierar

## License

This package is available under the MIT license.
