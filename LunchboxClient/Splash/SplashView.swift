import SwiftUI
struct SplashView: View {
    @Binding var splashCompleted: Bool
    @Environment(\.theme) var theme
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                ZStack {
                    defaultLogo()
                }
                .background(theme.colors.surfaceDefault.backgroundColor)
                .cornerRadius(24)
                .shadow(color: .black.opacity(0.08), radius: 0.1, x: 0, y:4)
                
                Spacer()
            }
            Spacer()
            
        }
        .background(theme.colors.surfaceBrand.backgroundColor)
        .ignoresSafeArea()
    }
    
    private func defaultLogo() -> some View  {
        theme.icons.base.brand
            .resizable()
            .frame(width: 80, height: 80)
            .padding(16)
    }
}


#Preview  {
    SplashView(splashCompleted: .constant(false))
}
