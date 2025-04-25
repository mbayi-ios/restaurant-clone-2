import Foundation
import SwiftUI

class Theme: Equatable {
    var colors = Colors()
    let typography: Typography = Typography()
    let icons: Icons = Icons()
    
    static func == (lhs: Theme, rhs: Theme) -> Bool {
        return lhs.colors == rhs.colors
    }
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue = Theme()
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue}
    }
}
