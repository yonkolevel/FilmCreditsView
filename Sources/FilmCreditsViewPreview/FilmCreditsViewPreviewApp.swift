import FilmCreditsView
import SwiftUI

@main
struct FilmCreditsViewPreviewApp: App {
    var body: some Scene {
        WindowGroup {
            FilmCreditsView(credits: CreditData.sample())
        }
    }
}
