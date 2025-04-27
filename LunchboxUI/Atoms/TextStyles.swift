import SwiftUI

extension Text {
    enum FontStyle {
        case displayXLarge
        case displayLarge
        case displayMedium
        case displaySmall
        case displaySmallMedium
        case headingLarge
        case headingMedium
        case headingMediumBold
        case headingSmall
        case subheadingMedium
        case subheading
        case subheadingSemiBold
        case subheading2
        case body
        case bodyBold
        case bodyMedium
        case caption
        case captionButton
        case button
        case buttonLink
        case buttonLinkBold
        case buttonLinkMedium
        case placeholderText
        case cellHeader
        case cellSubHeader
        case uiPlaceholderText
        case bottomHeader
    }
    
    enum TextOnSurface {
        case `default`
        case topNavigation
        case bottomNavigation
        case card
        case footer
        case brand
        case brandSubdued
    }
    
    enum TextColorType {
        case text
        case textSubdued
        case accent
        case separator
    }
    
    static func font(_ font: FontStyle, theme: Theme) -> Font {
        let typography = theme.typography
        return typography.fontBook[font] ?? typography.body
    }
    
    static func foregroundColor(surface: TextOnSurface, colorType: TextColorType, colors: Colors) -> Color {
        let surface: Colors.Surface = {
            switch surface {
            case .`default`:
                return colors.surfaceDefault
                
            case .topNavigation:
                return colors.surfaceTopNavigation
                
            case .bottomNavigation:
                return colors.surfaceBottomNavigation
                
            case .card:
                return colors.surfaceCard
                
            case .footer:
                return colors.surfaceFooter
                
            case .brand:
                return colors.surfaceBrand
                
            case .brandSubdued:
                return colors.surfaceBrandSubdued
            }
        }()
        
        switch colorType {
        case .text:
            return surface.textColor
            
        case .textSubdued:
            return surface.textSubduedColor
            
        case .accent:
            return surface.accentColor
            
        case .separator:
            return surface.separatorColor
        }
    }
}

extension View {
    func style(_ font: Text.FontStyle, theme: Theme) -> some View {
        self
            .font(Text.font(font, theme: theme))
    }
    
    func foregroundColor(surface: Text.TextOnSurface, colorType: Text.TextColorType, theme: Theme) -> some View {
        self
            .foregroundColor(Text.foregroundColor(surface: surface, colorType: colorType, colors: theme.colors))
    }
    
    func tintColor(surface: Text.TextOnSurface, tintType: Text.TextColorType, theme: Theme) -> some View {
        self
            .tint(Text.foregroundColor(surface: surface, colorType: tintType, colors: theme.colors))
    }
    
    func formatted(font: Text.FontStyle, surface: Text.TextOnSurface = .default, colorType: Text.TextColorType = .text, theme: Theme) -> some View {
        self
            .style(font, theme: theme)
            .foregroundColor(surface: surface, colorType: colorType, theme: theme)
    }
    
    func formatted(font: Text.FontStyle, surface: Text.TextOnSurface = .default, tintType: Text.TextColorType, theme: Theme) -> some View {
        self
            .style(font, theme: theme)
            .tintColor(surface: surface, tintType: tintType, theme: theme)
    }
}


