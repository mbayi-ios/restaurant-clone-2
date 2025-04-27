import SwiftUI

struct BaseNavigationView<Content: View>: View {
    @Environment(\.theme) var theme
    
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            DefaultSurface {
                content
                    .navigationBarColor(backgroundColor: UIColor(theme.colors.surfaceTopNavigation.backgroundColor))
                    .setStatusColor(on: theme.colors.surfaceTopNavigation.backgroundColor)
            }
        }
    }
}
