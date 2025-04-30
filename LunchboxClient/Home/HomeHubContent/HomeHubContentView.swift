import SwiftUI

struct HomeHubContentView: View {
    @Environment(\.theme) var theme
    
    private let title: String?
    init(hubMarketing: ThemeConfiguration.Settings.HubMarketing) {
        title = hubMarketing.title
    }
    
    var body: some View {
        VStack {
            if let title = title {
                Text(title)
            }
        }
    }
}
