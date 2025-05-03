
import Foundation

/// Represents a section of credits with a title and items
public struct CreditSection: Identifiable {
    public let id = UUID()
    public let title: String
    public let items: [CreditItem]
    public let fontSize: CGFloat
    public let spacing: CGFloat

    /// Creates a new credit section
    /// - Parameters:
    ///   - title: Title of the section (e.g., "Created By", "Special Thanks")
    ///   - items: Array of credit items in this section
    ///   - fontSize: Base font size for credit names in this section
    ///   - spacing: Spacing between items in this section
    public init(
        title: String,
        items: [CreditItem],
        fontSize: CGFloat = 20,
        spacing: CGFloat = 12
    ) {
        self.title = title
        self.items = items
        self.fontSize = fontSize
        self.spacing = spacing
    }
}
