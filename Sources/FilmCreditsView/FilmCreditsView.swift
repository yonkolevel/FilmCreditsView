import SwiftUI

public struct FilmCreditsView: View {
    private let credits: CreditData
    @State private var isAnimating: Bool = true
    @State private var scrollSpeed: Double = 1.0

    /// Creates a new film-style credits view
    /// - Parameter credits: The credits data to display
    public init(credits: CreditData) {
        self.credits = credits
    }

    public var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)

            creditsContent
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

            VStack {
                Spacer()
                controlBar
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }

    // MARK: - Components

    /// Control bar for play/pause and speed
    private var controlBar: some View {
        HStack {
            Button(action: { isAnimating.toggle() }) {
                Text(isAnimating ? "Pause" : "Play")
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())

            Spacer()

            HStack(spacing: 8) {
                Text("Speed:")
                    .foregroundColor(.white)
                Slider(value: $scrollSpeed, in: 0.5 ... 3.0, step: 0.5)
                    .frame(width: 100)
                Text("\(scrollSpeed, specifier: "%.1f")x")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 24)
        .background(Color.black.opacity(0.8).blur(radius: 2))
    }

    /// Main scrolling credits content
    private var creditsContent: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    // Top spacer for initial position
                    Spacer()
                        .frame(height: geometry.size.height / 2)

                    // Credits content
                    creditsBody

                    // Bottom spacer
                    Spacer()
                        .frame(height: geometry.size.height / 2)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .modifier(AutoScrollModifier(
                    isEnabled: $isAnimating,
                    speed: scrollSpeed,
                    contentHeight: geometry.size.height * 3
                ))
            }
            .mask(
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black, .black, .clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }

    /// The actual content of the credits
    private var creditsBody: some View {
        VStack(spacing: 80) {
            // App title
            VStack(spacing: 12) {
                Text(credits.appName)
                    .font(.system(size: 42, weight: .bold))
                    .tracking(2)

                Text("Version \(credits.version) • \(credits.releaseDate)")
                    .font(.system(size: 18))
            }
            .padding(.bottom, 60)

            // Credit sections
            ForEach(credits.sections) { section in
                CreditSectionView(section: section)
            }

            // Copyright
            VStack(spacing: 8) {
                Text(credits.copyright)
                    .font(.system(size: 16))
                Text(credits.website)
                    .font(.system(size: 14))
                    .opacity(0.7)
            }
            .padding(.top, 60)
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
}

// MARK: - Preview

#if DEBUG
    struct FilmCreditsView_Previews: PreviewProvider {
        static var previews: some View {
            FilmCreditsView(credits: CreditData.sample())
        }
    }
#endif
