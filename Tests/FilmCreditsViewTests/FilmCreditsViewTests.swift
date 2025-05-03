@testable import FilmCreditsView
import SwiftUI
import XCTest

final class FilmCreditsViewTests: XCTestCase {
    func testCreditItemInitialization() {
        // Test with required parameters
        let item = CreditItem(name: "Test Person")
        XCTAssertEqual(item.name, "Test Person")
        XCTAssertEqual(item.role, "")

        // Test with all parameters
        let itemWithRole = CreditItem(name: "Test Person", role: "Tester")
        XCTAssertEqual(itemWithRole.name, "Test Person")
        XCTAssertEqual(itemWithRole.role, "Tester")
    }

    func testCreditSectionInitialization() {
        // Test with required parameters
        let items = [CreditItem(name: "Person 1"), CreditItem(name: "Person 2")]
        let section = CreditSection(title: "Test Section", items: items)

        XCTAssertEqual(section.title, "Test Section")
        XCTAssertEqual(section.items.count, 2)
        XCTAssertEqual(section.fontSize, 20)
        XCTAssertEqual(section.spacing, 12)

        // Test with all parameters
        let customSection = CreditSection(
            title: "Custom Section",
            items: items,
            fontSize: 32,
            spacing: 16
        )

        XCTAssertEqual(customSection.title, "Custom Section")
        XCTAssertEqual(customSection.items.count, 2)
        XCTAssertEqual(customSection.fontSize, 32)
        XCTAssertEqual(customSection.spacing, 16)
    }

    func testCreditDataInitialization() {
        // Test initialization with parameters
        let section = CreditSection(
            title: "Test Section",
            items: [CreditItem(name: "Person", role: "Role")]
        )

        let data = CreditData(
            appName: "Test App",
            version: "1.0",
            releaseDate: "2025",
            sections: [section],
            copyright: "© 2025",
            website: "example.com"
        )

        XCTAssertEqual(data.appName, "Test App")
        XCTAssertEqual(data.version, "1.0")
        XCTAssertEqual(data.releaseDate, "2025")
        XCTAssertEqual(data.sections.count, 1)
        XCTAssertEqual(data.copyright, "© 2025")
        XCTAssertEqual(data.website, "example.com")
    }

    func testSampleDataCreation() {
        // Test sample data creation method
        let sample = CreditData.sample()

        XCTAssertFalse(sample.appName.isEmpty)
        XCTAssertFalse(sample.version.isEmpty)
        XCTAssertFalse(sample.releaseDate.isEmpty)
        XCTAssertGreaterThan(sample.sections.count, 0)
        XCTAssertFalse(sample.copyright.isEmpty)
        XCTAssertFalse(sample.website.isEmpty)
    }

    static var allTests = [
        ("testCreditItemInitialization", testCreditItemInitialization),
        ("testCreditSectionInitialization", testCreditSectionInitialization),
        ("testCreditDataInitialization", testCreditDataInitialization),
        ("testSampleDataCreation", testSampleDataCreation),
    ]
}
