import SwiftUI

extension RootNavigationView {
    enum Tab {
        case home
        case account
        
    }
    
    struct TabItem: View {
        @Environment(\.theme) var theme: Theme
        
        private let isSelected: Bool
        private let action: () -> Void
        private let title: String
        private let iconDefault: Image
        private let iconSelected: Image
        var tabIcon: String? = "selected"
        
        init(isSelected: Bool, title: String, icon: Image, iconSelected: Image, tabIcon: String? = nil, action: @escaping() -> Void) {
            self.action = action
            self.isSelected = isSelected
            self.iconDefault = icon
            self.iconSelected = iconSelected
            self.tabIcon = tabIcon
            self.title = title
        }
        
        var body: some View{
            Button {
                action()
            } label: {
                VStack(alignment: .center) {
                   icon()
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(isSelected ? .red : .black)
                    Text(title)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(isSelected ? .red : .black)
                }
                
            }
            .foregroundColor(tint())
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding(.vertical, 4)
        }
        
        private func tint() -> Color {
            isSelected ? theme.colors.surfaceBottomNavigation.accentColor : theme.colors.surfaceBottomNavigation.textColor
        }
        
        private func icon() -> Image {
            isSelected ? iconSelected : iconDefault
        }
    }
}
