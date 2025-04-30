import SwiftUI

extension Button
{
    func primary(width: CGFloat? = nil, height: CGFloat? = nil, paddingVertical: CGFloat? = nil, paddingHorizontal: CGFloat? = nil) -> some View
    {
        buttonStyle(BorderedFilled(.primary, height: height, width: width, paddingVertical: paddingVertical, paddingHorizontal: paddingHorizontal))
    }
    
    func footer() -> some View
    {
        buttonStyle(Footer())
    }
    
    func bottom() -> some View {
        buttonStyle(Bottom())
    }
    
    func secondary() -> some View {
        buttonStyle(BorderedFilled(.secondary))
    }

    func tertiary(width: CGFloat? = nil, height: CGFloat? = nil, paddingVertical: CGFloat? = nil) -> some View
    {
        buttonStyle(BorderedFilled(.tertiary, height: height, width: width, paddingVertical: paddingVertical))
    }

    func interactiveOnDefault() -> some View
    {
        buttonStyle(Interactive(style: .standard))
    }

    func interactiveOnCard() -> some View
    {
        buttonStyle(Interactive(style: .standard))
    }

    func interactiveOnPrimary() -> some View
    {
        buttonStyle(Interactive(style: .standardOnPrimary))
    }

    func link() -> some View
    {
        buttonStyle(Interactive(style: .standard))
    }

    func linkBold() -> some View
    {
        buttonStyle(Interactive(style: .bold))
    }

    func criticalLink() -> some View
    {
        buttonStyle(Interactive(style: .critical))
    }
    
    func radio(isSelected: Binding<Bool>) -> some View
    {
        buttonStyle(Radio(isSelected: isSelected))
    }

  
}

private struct BorderedFilled: ButtonStyle
{
    @Environment(\.theme) var theme: Theme
    @Environment(\.isEnabled) private var isEnabled

    init(_ style: Style, height: CGFloat? = nil, width: CGFloat? = nil, paddingVertical: CGFloat? = nil, paddingHorizontal: CGFloat? = nil)
    {
        self.style = style
        self.height = height
        self.width = width
        self.paddingVertical = paddingVertical
        self.paddingHorizontal = paddingHorizontal
    }

    enum Style
    {
        case primary
        case secondary
        case tertiary
    }

    private let style: Style
    private var height: CGFloat? = nil
    private var width: CGFloat? = nil
    private var paddingVertical: CGFloat? = nil
    private var paddingHorizontal: CGFloat? = nil

    func makeBody(configuration: Self.Configuration) -> some View
    {
        let cornerRadius: CGFloat
        let onFill: Color
        let fill: Color
        let fillPressed: Color
        let border: Color
        let font: Font

        switch (style, isEnabled)
        {
        case (.primary, true):
            cornerRadius = theme.colors.primaryButton.cornerRadius
            onFill = theme.colors.primaryButton.textColor
            fill = theme.colors.primaryButton.backgroundColor
            fillPressed = theme.colors.primaryButton.backgroundColor
            border = theme.colors.primaryButton.borderColor
            font = theme.typography.button

        case (.primary, false):
            cornerRadius = theme.colors.primaryButton.cornerRadius
            onFill = theme.colors.primaryButton.disabledTextColor
            fill = theme.colors.primaryButton.disabledBackgroundColor
            fillPressed = theme.colors.primaryButton.disabledBackgroundColor
            border = theme.colors.primaryButton.disabledBorderColor
            font = theme.typography.button

        case (.secondary, true):
            cornerRadius = theme.colors.secondaryButton.cornerRadius
            onFill = theme.colors.secondaryButton.textColor
            fill = theme.colors.secondaryButton.backgroundColor
            fillPressed = theme.colors.secondaryButton.backgroundColor
            border = theme.colors.secondaryButton.borderColor
            font = theme.typography.button

        case (.secondary, false):
            cornerRadius = theme.colors.secondaryButton.cornerRadius
            onFill = theme.colors.secondaryButton.disabledTextColor
            fill = theme.colors.secondaryButton.disabledBackgroundColor
            fillPressed = theme.colors.secondaryButton.disabledBackgroundColor
            border = theme.colors.secondaryButton.disabledBorderColor
            font = theme.typography.button

        case (.tertiary, _):
            cornerRadius = theme.colors.tertiaryButton.cornerRadius
            onFill = theme.colors.tertiaryButton.textColor
            fill = theme.colors.tertiaryButton.backgroundColor
            fillPressed = theme.colors.tertiaryButton.backgroundColor
            border = theme.colors.tertiaryButton.borderColor
            font = theme.typography.button
        }

        return Group {
            configuration.label
                .font(font)
                .padding(.vertical, paddingVertical ?? 13)
        }.frame(maxWidth: width ?? .infinity)
            .frame(minHeight: height ?? 48)
            .padding(.horizontal, paddingHorizontal ?? 16)
            .foregroundColor(onFill)
            .background(configuration.isPressed ? fillPressed : fill)
            .cornerRadius(CGFloat(cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(border , lineWidth: 1.0)
            )
    }
}

private struct Interactive: ButtonStyle
{
    @Environment(\.theme) var theme: Theme

    enum InteractiveStyle
    {
        case standard
        case standardOnPrimary
        case bold
        case critical
    }

    let style: InteractiveStyle

    func makeBody(configuration: Self.Configuration) -> some View
    {
        let foregroundColor: Color
        let font: Font

        switch style
        {
        case .standard:
            foregroundColor = theme.colors.surfaceDefault.accentColor
            font = theme.typography.buttonLink

        case .standardOnPrimary:
            foregroundColor = theme.colors.surfaceBrand.textColor
            font = theme.typography.buttonLink

        case .bold:
            foregroundColor = theme.colors.surfaceDefault.accentColor
            font = theme.typography.buttonLinkBold

        case .critical:
            foregroundColor = theme.colors.surfaceDefault.accentColor
            font = theme.typography.buttonLinkBold
        }

        return configuration.label
            .foregroundColor(foregroundColor)
            .font(font)
    }
}

private struct Footer: ButtonStyle
{
    @Environment(\.theme) var theme: Theme

    func makeBody(configuration: Self.Configuration) -> some View
    {
        return VStack {
            configuration.label
                .style(.button, theme: theme)
                .padding(.top, 13)
            Spacer()
        }
        .foregroundColor(theme.colors.surfaceBrand.textColor)
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(theme.colors.surfaceBrand.backgroundColor)
    }
}

private struct Bottom: ButtonStyle {
    @Environment(\.theme) var theme: Theme
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return VStack() {
            Spacer()
            configuration.label
                .font(theme.typography.button)
            Spacer()
        }
        .foregroundColor(isEnabled ? theme.colors.primaryButton.textColor : theme.colors.primaryButton.disabledTextColor)
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .background(isEnabled ? theme.colors.primaryButton.backgroundColor.edgesIgnoringSafeArea(.bottom) : theme.colors.primaryButton.disabledBackgroundColor.edgesIgnoringSafeArea(.bottom))
    }
}

private struct Radio: ButtonStyle {
    @Environment(\.theme) var theme: Theme

    @Binding var isSelected: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View
    {
        if isSelected
        {
            Circle()
                .strokeBorder(theme.colors.surfaceDefault.accentColor)
                .background(
                    Circle().fill(theme.colors.surfaceDefault.accentColor)
                        .frame(width: 8, height: 8)
                )
                .frame(width: 16, height: 16)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }
        else
        {
            Circle()
                .strokeBorder(theme.colors.surfaceDefault.separatorColor)
                .frame(width: 16, height: 16)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }
    }
}
