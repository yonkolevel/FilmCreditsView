import SwiftUI

/// A view that displays a section of credits
public struct CreditSectionView: View {
    private let section: CreditSection

    /// Creates a new credit section view
    /// - Parameter section: The credit section to display
    public init(section: CreditSection) {
        self.section = section
    }

    public var body: some View {
        VStack(spacing: section.spacing) {
            // Section title with caps and tracking
            Text(section.title.uppercased())
                .font(.system(size: 14, weight: .medium))
                .tracking(8)
                .opacity(0.6)
                .padding(.bottom, 16)

            // Credit items
            ForEach(section.items) { credit in
                VStack(spacing: 4) {
                    Text(credit.name)
                        .font(.system(size: section.fontSize, weight: .semibold))
                        .tracking(1)

                    if !credit.role.isEmpty {
                        Text(credit.role)
                            .font(.system(size: section.fontSize * 0.8))
                            .opacity(0.8)
                    }
                }
                .padding(.bottom, 8)
            }
        }
        .padding(.bottom, 20)
    }
}

#if DEBUG
    struct CreditSectionView_Previews: PreviewProvider {
        static var previews: some View {
            CreditSectionView(section: CreditSection(
                title: "Created By",
                items: [
                    CreditItem(name: "Your Name", role: "Creator & Developer"),
                ],
                fontSize: 32,
                spacing: 20
            ))
            .background(Color.black)
            .foregroundColor(.white)
            .previewLayout(.sizeThatFits)
        }
    }
#endif
