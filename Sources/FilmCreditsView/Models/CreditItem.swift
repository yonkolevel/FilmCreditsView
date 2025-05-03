
import Foundation

/// Represents a single credit item with a name and role
public struct CreditItem: Identifiable {
    public let id = UUID()
    public let name: String
    public let role: String

    /// Creates a new credit item
    /// - Parameters:
    ///   - name: Name of the person
    ///   - role: Role of the person (can be empty)
    public init(name: String, role: String = "") {
        self.name = name
        self.role = role
    }
}
