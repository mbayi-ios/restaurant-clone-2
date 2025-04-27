import SwiftUI

struct BaseView<Content: View>: View {
    @Environment(\.theme) var theme
    
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        DefaultSurface {
            content
                 .setStatusColor(on: theme.colors.surfaceDefault.backgroundColor)
        }
    }
}
