import SwiftUI
import Foundation

extension Color
{
    struct Fallback
    {
        // MARK: - Brand
        static let brand = Color("Brand", bundle: .main)
        static let accentBrand: Color = Fallback.brand

        // MARK: - Surface
        static let surfaceWhite: Color = .white
        static let surfaceBlack: Color = .black

        // MARK: - Border
        static let borderPressed = Color(stringLiteral: "#515F5F")

        // MARK: - System
        static let textWhite: Color = .white
        static let textBlack: Color = .black
        static let textSuccess = Color(stringLiteral: "#069360")
        static let textWarning = Color(stringLiteral: "#98661B")
        static let textCritical = Color(stringLiteral: "#B53317")

        // MARK: - Consolidated Alert View
        static let surfaceWarning = Color(stringLiteral: "#FFFEE9")
        static let surfaceError = Color(stringLiteral: "#FEF2F2")
        static let surfaceSuccess = Color(stringLiteral: "#EEFFFF")

        static let indicatorSuccess = Color(stringLiteral: "#059669")
        static let indicatorCritical = Color(stringLiteral: "#B91C1C")
        static let indicatorWarning = Color(stringLiteral: "#8F7107")

        static let borderSuccess = Color(stringLiteral: "#07B8BA")
        static let borderCritical = Color(stringLiteral: "#B91C1C")
    }
}

extension Colors.Surface
{
    struct Fallback
    {
        static let surfaceDefault = Colors.Surface(backgroundColor: Color(stringLiteral: "#FFFFFF"),
                                                   textColor: Color(stringLiteral: "#000000"),
                                                   textSubduedColor: Color(stringLiteral: "#737373"),
                                                   accentColor: Color("Brand", bundle: .main),
                                                   separatorColor: Color(stringLiteral: "#737373"))

        static let surfaceTopNavigation = Colors.Surface(backgroundColor: Color(stringLiteral: "#FFFFFF"),
                                                         textColor: Color(stringLiteral: "#000000"),
                                                         textSubduedColor: Color(stringLiteral: "#737373"),
                                                         accentColor: Color("Brand", bundle: .main),
                                                         separatorColor: Color(stringLiteral: "#737373"))

        static let surfaceBottomNavigation = Colors.Surface(backgroundColor: Color(stringLiteral: "#FFFFFF"),
                                                            textColor: Color(stringLiteral: "#000000"),
                                                            textSubduedColor: Color(stringLiteral: "#737373"),
                                                            accentColor: Color("Brand", bundle: .main),
                                                            separatorColor: Color(stringLiteral: "#737373"))

        static let surfaceCard = Colors.Surface(backgroundColor: Color(stringLiteral: "#FFFFFF"),
                                                textColor: Color(stringLiteral: "#000000"),
                                                textSubduedColor: Color(stringLiteral: "#737373"),
                                                accentColor: Color("Brand", bundle: .main),
                                                separatorColor: Color(stringLiteral: "#E5E5E5"))
        
        static let surfaceFooter = Colors.Surface(backgroundColor: Color(stringLiteral: "#F5F5F5"),
                                                textColor: Color(stringLiteral: "#000000"),
                                                textSubduedColor: Color(stringLiteral: "#737373"),
                                                accentColor: Color("Brand", bundle: .main),
                                                separatorColor: Color(stringLiteral: "#E5E5E5"))

        static let surfaceBrand = Colors.Surface(backgroundColor: Color("Brand", bundle: .main),
                                                 textColor: Color(stringLiteral: "#FFFFFF"),
                                                 textSubduedColor: Color(stringLiteral: "#E5E5E5"),
                                                 accentColor: Color(stringLiteral: "#FFFFFF"),
                                                 separatorColor: Color(stringLiteral: "#000000"))
    }
}

extension Colors.ButtonStyle
{
    struct Fallback
    {
        static let primaryButton = Colors.ButtonStyle(cornerRadius: 6,
                                                      textColor: Color(stringLiteral: "#FFFFFF"),
                                                      backgroundColor: Color(stringLiteral: "#000000"),
                                                      borderColor: Color(stringLiteral: "#000000"),
                                                      disabledTextColor: Color(stringLiteral: "#737373"),
                                                      disabledBackgroundColor: Color(stringLiteral: "#A1A1A1"),
                                                      disabledBorderColor: Color(stringLiteral: "#A1A1A1"))

        static let secondaryButton = Colors.ButtonStyle(cornerRadius: 6,
                                                        textColor: Color(stringLiteral: "#000000"),
                                                        backgroundColor: Color(stringLiteral: "#FFFFFF"),
                                                        borderColor: Color(stringLiteral: "#FFFFFF"),
                                                        disabledTextColor: Color(stringLiteral: "#737373"),
                                                        disabledBackgroundColor: Color(stringLiteral: "#A1A1A1"),
                                                        disabledBorderColor: Color(stringLiteral: "#A1A1A1"))

        static let tertiaryButton = Colors.ButtonStyle(cornerRadius: 6,
                                                       textColor: Color(stringLiteral: "#000000"),
                                                       backgroundColor: Color(stringLiteral: "#FFFFFF"),
                                                       borderColor: Color(stringLiteral: "#000000"),
                                                       disabledTextColor: Color(stringLiteral: "#737373"),
                                                       disabledBackgroundColor: Color(stringLiteral: "#A1A1A1"),
                                                       disabledBorderColor: Color(stringLiteral: "#A1A1A1"))
    }
}
