import SwiftUI
import CoreText

public struct Typography
{
    static let Inter = "Inter"

    var fontBook: [Text.FontStyle: Font] =
    [
        .displayXLarge: header(size: 42).weight(.bold),
        .displayLarge: header(size: 32).weight(.bold),
        .displayMedium: header(size: 26).weight(.bold),
        .displaySmall: header(size: 20).weight(.regular),
        .displaySmallMedium: header(size: 20).weight(.medium),
        .headingMediumBold: header(size: 18).weight(.bold),
        .headingLarge: header(size: 24).weight(.bold),
        .headingMedium: header(size: 20).weight(.bold),
        .headingSmall: header(size: 16).weight(.bold),
        .subheadingMedium: header(size: 14).weight(.semibold),
        .subheading: header(size: 12).weight(.semibold),
        .subheadingSemiBold: header(size: 15).weight(.semibold),
        .cellHeader: header(size: 14).weight(.bold),
        .cellSubHeader: header(size: 12).weight(.bold),
        .bottomHeader: header(size: 10).weight(.bold),
        .subheading2: body(size: 10),
        .body: body(size: 14),
        .bodyBold : body(size: 14).weight(.bold),
        .bodyMedium : body(size: 15).weight(.semibold),
        .caption: body(size: 12),
        .captionButton: body(size: 10),
        .button: body(size: 16).weight(.bold),
        .buttonLink: body(size: 12),
        .buttonLinkBold: body(size: 12).weight(.bold),
        .buttonLinkMedium: body(size: 13).weight(.medium) ,
        .placeholderText: body(size: 14)
    ]

    public var displayXLarge: Font { header(size: 42).weight(.bold) }

    public var displayLarge: Font { header(size: 32).weight(.semibold) }

    public var displayMedium: Font { header(size: 26).weight(.regular)}

    public var displaySmall: Font { header(size: 20).weight(.regular) }

    public var displaySmallMedium: Font { header(size: 20).weight(.medium) }

    public var headingLarge: Font { header(size: 24).weight(.semibold) }

    public var headingMedium: Font { header(size: 20).weight(.semibold) }

    public var headingSmall: Font { header(size: 16).weight(.semibold) }

    public var subheadingMedium: Font { header(size: 14).weight(.medium) }

    public var subheading: Font { header(size: 12).weight(.semibold) }

    public var subheadingSemiBold: Font { header(size: 15).weight(.semibold) }

    public var subheading2: Font { body(size: 10) }

    public var body: Font { body(size: 14) }

    public var caption: Font { body(size: 12) }

    public var button: Font { body(size: 16).weight(.bold) }

    public var buttonLink: Font { body(size: 12) }

    public var buttonLinkBold: Font { body(size: 12).weight(.bold) }
    
    public var buttonLinkMedium: Font { body(size: 13).weight(.medium) }

    public var placeholderText: Font { body(size: 14) }

    public var cellHeader: Font { header(size: 14).weight(.bold) }
    
    public var cellSubHeader: Font { header(size: 12).weight(.bold) }
    
    public var bottomHeader: Font { header(size: 10).weight(.bold) }
    
    public var uiPlaceholderText: UIFont? { UIFont(name: Typography.bodyFontName ?? Typography.Inter, size: 14) }

    // - Private

    private static var headerFontName: String?
    {
        return Config.shared.headerFontName
    }

    private static var bodyFontName: String?
    {
        return Config.shared.bodyFontName
    }

    private func header(size: CGFloat) -> Font
    {
        return Typography.header(size: size)
    }

    private func body(size: CGFloat) -> Font
    {
        return Typography.body(size: size)
    }

    private static func header(size: CGFloat) -> Font
    {
        return font(fontName: headerFontName, size: size)
    }

    private static func body(size: CGFloat) -> Font
    {
        return font(fontName: bodyFontName, size: size)
    }

    private static func font(fontName: String?, size: CGFloat) -> Font
    {
        guard let fontName = fontName, !fontName.isEmpty else
        {
            return Font.custom(Typography.Inter, size: size)
        }

        return Font.custom(fontName, size: size)
    }
}

