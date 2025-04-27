import SwiftUI

struct RootNavigationView: View {
    @Environment(\.theme) var theme: Theme
    @State var tab: Tab = .home
    
    var body: some View {
        VStack {
            selectedView()
            tabBar()
        }
        .ignoresSafeArea(.keyboard)
    }
    
    private func tabBar() -> some View {
        ZStack {
            theme.colors.surfaceBottomNavigation.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Divider()
                    .foregroundColor(theme.colors.surfaceBottomNavigation.separatorColor)
                
                HStack {
                    TabItem(isSelected: tab == .home, title: "home", icon: Image(systemName: "house"),
                            iconSelected: Image(systemName: "house.fill")) {
                        tab = .home
                    }
                    
                    TabItem(isSelected: tab == .account, title: "Account", icon: Image(systemName: "person"),
                            iconSelected: Image(systemName: "person.fill")) {
                        tab = .account
                    }
                }
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
        }
        .frame(height: 49)
    }
    
    private func selectedView() -> some View {
        switch tab {
        case .home:
            return AnyView(HomeView())
            
        case .account:
            return AnyView(AccountView())
        }
    }
}

