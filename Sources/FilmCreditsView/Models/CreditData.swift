import Foundation

/// Main data container for all credits information
public struct CreditData {
    public let appName: String
    public let version: String
    public let releaseDate: String
    public let sections: [CreditSection]
    public let copyright: String
    public let website: String

    /// Creates a complete credits data structure
    /// - Parameters:
    ///   - appName: Name of the app
    ///   - version: Version of the app
    ///   - releaseDate: Release date as string
    ///   - sections: Array of credit sections
    ///   - copyright: Copyright notice
    ///   - website: Website URL as string
    public init(
        appName: String,
        version: String,
        releaseDate: String,
        sections: [CreditSection],
        copyright: String,
        website: String
    ) {
        self.appName = appName
        self.version = version
        self.releaseDate = releaseDate
        self.sections = sections
        self.copyright = copyright
        self.website = website
    }

    /// Creates a sample credits data structure for preview or testing
    public static func sample() -> CreditData {
        CreditData(
            appName: "Sample App",
            version: "1.0",
            releaseDate: "2025",
            sections: [
                CreditSection(
                    title: "Created By",
                    items: [
                        CreditItem(name: "Your Name", role: "Creator & Developer"),
                    ],
                    fontSize: 32,
                    spacing: 20
                ),
                CreditSection(
                    title: "Key Contributors",
                    items: [
                        CreditItem(name: "Jane Smith", role: "UX Design"),
                        CreditItem(name: "John Doe", role: "Icon Design"),
                        CreditItem(name: "Alex Johnson", role: "Beta Testing Lead"),
                    ],
                    fontSize: 24,
                    spacing: 16
                ),
                CreditSection(
                    title: "Special Thanks",
                    items: [
                        CreditItem(name: "Sarah Williams", role: "Feature Ideas"),
                        CreditItem(name: "Michael Chen", role: "Usability Feedback"),
                    ],
                    fontSize: 18,
                    spacing: 12
                ),
            ],
            copyright: "© 2025 Your Company. All Rights Reserved.",
            website: "www.yourwebsite.com"
        )
    }
}
