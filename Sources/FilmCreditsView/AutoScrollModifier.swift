import SwiftUI

/// A view modifier that adds automatic vertical scrolling to any view
public struct AutoScrollModifier: ViewModifier {
    @Binding private var isEnabled: Bool
    private let speed: Double
    private let contentHeight: CGFloat

    @State private var scrollOffset: CGFloat = 0
    @State private var timer: Timer?

    /// Creates a new auto-scroll modifier
    /// - Parameters:
    ///   - isEnabled: Whether scrolling is currently active
    ///   - speed: Scrolling speed multiplier
    ///   - contentHeight: Estimated content height for calculating reset position
    public init(isEnabled: Binding<Bool>, speed: Double, contentHeight: CGFloat) {
        _isEnabled = isEnabled
        self.speed = speed
        self.contentHeight = contentHeight
    }

    public func body(content: Content) -> some View {
        content
            .offset(y: -scrollOffset)
            .onAppear {
                startScrollingIfNeeded()
            }
            .onChange(of: isEnabled) { newValue in
                if newValue {
                    startScrollingIfNeeded()
                } else {
                    stopScrolling()
                }
            }
            .onChange(of: speed) { _ in
                restartScrollingIfNeeded()
            }
            .onDisappear {
                stopScrolling()
            }
    }

    private func startScrollingIfNeeded() {
        guard isEnabled else { return }

        stopScrolling()

        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            scrollOffset += 0.5 * speed

            if scrollOffset >= contentHeight {
                scrollOffset = 0
            }
        }
    }

    private func stopScrolling() {
        timer?.invalidate()
        timer = nil
    }

    private func restartScrollingIfNeeded() {
        stopScrolling()
        startScrollingIfNeeded()
    }
}
