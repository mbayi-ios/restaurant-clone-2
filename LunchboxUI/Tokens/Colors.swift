import Foundation
import SwiftUI

class Colors
{
    struct Surface
    {
        var backgroundColor: Color
        var textColor: Color
        var textSubduedColor: Color
        var accentColor: Color
        var separatorColor: Color
    }

    struct ButtonStyle
    {
        var cornerRadius: CGFloat
        var textColor: Color
        var backgroundColor: Color
        var borderColor: Color
        var disabledTextColor: Color
        var disabledBackgroundColor: Color
        var disabledBorderColor: Color
    }

    // MARK: - Surface
    var surfaceDefault: Surface = .Fallback.surfaceDefault
    var surfaceTopNavigation: Surface = .Fallback.surfaceTopNavigation
    var surfaceBottomNavigation: Surface = .Fallback.surfaceBottomNavigation
    var surfaceCard: Surface = .Fallback.surfaceCard
    var surfaceFooter: Surface = .Fallback.surfaceFooter
    var surfaceBrand: Surface = .Fallback.surfaceBrand
    var surfaceBrandSubdued: Surface
    {
        let backgroundColor = surfaceBrand.backgroundColor.opacity(0.30)
        return Surface(
            backgroundColor: backgroundColor,
            textColor: surfaceDefault.textColor,
            textSubduedColor: surfaceDefault.textSubduedColor,
            accentColor: surfaceDefault.accentColor,
            separatorColor: surfaceDefault.separatorColor
        )
    }

    // MARK: - ButtonStyle
    var primaryButton: ButtonStyle = .Fallback.primaryButton
    var secondaryButton: ButtonStyle = .Fallback.secondaryButton
    var tertiaryButton: ButtonStyle = .Fallback.tertiaryButton

    // MARK: - Brand
    var brand: Color = .Fallback.brand
    var accentBrand: Color = .Fallback.accentBrand

    // MARK: - Surface
    var surfaceWhite: Color = .Fallback.surfaceWhite
    var surfaceBlack: Color = .Fallback.surfaceBlack

    // MARK: - Text
    var textWhite: Color = .Fallback.textWhite
    var textBlack: Color = .Fallback.textBlack
    var textSuccess: Color = .Fallback.textSuccess
    var textWarning: Color = .Fallback.textWarning
    var textCritical: Color = .Fallback.textCritical
    
    // MARK: - Border
    var borderPressed: Color = .Fallback.borderPressed

    // MARK: - Consolidated Alert View
    var surfaceWarning: Color  = .Fallback.surfaceWarning
    var surfaceError: Color = .Fallback.surfaceError
    var surfaceSuccess: Color = .Fallback.surfaceSuccess

    var indicatorSuccess: Color = .Fallback.indicatorSuccess
    var indicatorCritical: Color = .Fallback.indicatorCritical
    var indicatorWarning: Color = .Fallback.indicatorWarning

    var borderSuccess: Color = .Fallback.borderSuccess
    var borderCritical: Color = .Fallback.borderCritical
}



// MARK: - Color
extension Color
{
    mutating func load(_ themeColor: Color?, fallback fallbackColor: Color?)
    {
        if let themeColor = themeColor
        {
            self = themeColor
        }
        else if let fallbackColor = fallbackColor
        {
            self = fallbackColor
        }
    }

    mutating func load(_ themeColor: String?, fallback fallbackColor: Color?)
    {
        if let themeColor = themeColor
        {
            self = Color(stringLiteral: themeColor)
        }
        else if let fallbackColor = fallbackColor
        {
            self = fallbackColor
        }
    }

    init(stringLiteral: String?, fallback fallbackColor: Color)
    {
        guard let stringLiteral = stringLiteral else
        {
            self = fallbackColor
            return
        }

        self = Color(stringLiteral: stringLiteral)
    }
}


// MARK: - Helper
extension Colors
{
    /// Returns `textBlack` or `textWhite` depending on the contrast to the given surface color
    private func contrastStandardTextColor(on surfaceColor: Color) -> Color
    {
        if surfaceColor.isLight()
        {
            return textBlack
        }
        else
        {
            return textWhite
        }
    }

    /// Returns `surfaceBlack` or `surfaceWhite` depending on the contrast to the given surface color
    private func contrastStandardSurfaceColor(on surfaceColor: Color) -> Color
    {
        if surfaceColor.isLight()
        {
            return surfaceBlack
        }
        else
        {
            return surfaceWhite
        }
    }
}

// MARK: - Calculated
extension Colors
{
    private func contrastTextColor(on backgroundColor: Color) -> Color
    {
        return backgroundColor.isLight() ? textBlack : textWhite
    }

    private func contrastBackgroundColor(on backgroundColor: Color) -> Color
    {
        return backgroundColor.isLight() ? surfaceBlack : surfaceWhite
    }

    // Logic to make sure that text/icon on the bottom navigation
    // are always legible based on contract to the background
    private func calculatedAccentText(on backgroundColor: Color) -> Color
    {
        if backgroundColor.isLight()
        {
            guard brand.isLight() else
            {
                // If the surface is light and brand is dark, use brand
                return brand
            }

            guard accentBrand.isLight() else
            {
                // If the surface is light and accent is dark, use accent
                return accentBrand
            }

            // If the surface is light and neither brand nor accent is dark,
            // use an off-black (off-black because unselected text color is black)
            return textBlack
                .adjust(by: 40)
        }
        else
        {
            guard !brand.isLight() else
            {
                // If the surface is dark and brand is light, use brand
                return brand
            }

            guard !accentBrand.isLight() else
            {
                // If the surface is dark and accent is light, use accent
                return accentBrand
            }

            // If the surface is dark and neither brand nor accent is light,
            // use an off-white (off-white because unselected text color is white)
            return textWhite
                .adjust(by: -40)
        }
    }
}

// MARK: - Equatable
extension Colors: Equatable
{
    static func == (lhs: Colors, rhs: Colors) -> Bool
    {
        return lhs.brand == rhs.brand
    }
}

extension View
{
    func setStatusColor(on backgroundColor: Color) -> some View
    {
        self
           // .preferredColorScheme(backgroundColor.isLight() ? .dark : .light)
    }
}
