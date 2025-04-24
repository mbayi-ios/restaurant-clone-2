import SwiftUI

struct RootNavigationView: View {
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
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Divider()
                    .foregroundColor(Color.yellow)
                
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
