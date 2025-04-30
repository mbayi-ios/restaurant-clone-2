import SwiftUI
import Nuke
import NukeUI

struct HomeHubContentView: View {
    @Environment(\.theme) var theme
    
    private let title: String?
    private let description: String?
    private let imageUrl: String?
    private let buttonText: String?
    private let buttonUrlString: String?
    
    init(hubMarketing: ThemeConfiguration.Settings.HubMarketing) {
        title = hubMarketing.title
        description = hubMarketing.description
        imageUrl = hubMarketing.image
        buttonText = hubMarketing.buttonText
        buttonUrlString = hubMarketing.buttonURL
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            if let imageUrl = imageUrl {
                LazyImage(url: URL(string: imageUrl),
                          transaction: Transaction(animation: .interactiveSpring()),
                          content: { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                        
                    } else {
                        ProgressView()
                    }
                })
            }
            contentDescriptionView()
            ctaButtonView()
        }
        .background(theme.colors.surfaceCard.backgroundColor)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(theme.colors.surfaceCard.separatorColor, lineWidth: 1)
        )
        
    }
    
    private func contentDescriptionView() -> some View {
        VStack(alignment: .leading, spacing: 11) {
            if let title = title {
                Text(title)
                    .formatted(font: .headingMedium, surface: .card, theme: theme)
                    .padding(.horizontal, 16)
            }
            
            if let description = description {
                Text(description)
                    .formatted(font: .body, colorType: .textSubdued, theme: theme)
                    .padding(.horizontal, 16)
            }
        }
    }
    
    @ViewBuilder
    private func ctaButtonView() -> some View {
        Button {
            
        } label: {
            Text("Button Text")
        }
        .padding(.leading, 16)
        .padding(.bottom, 16)
        Spacer()
            .padding(.trailing)
        
    }
    
}
