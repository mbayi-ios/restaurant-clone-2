import SwiftUI

struct BottomNavigationSurface<Content: View>: View {
    @Environment(\.theme) var theme
    
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .background(theme.colors.surfaceBottomNavigation.backgroundColor)
    }
}
