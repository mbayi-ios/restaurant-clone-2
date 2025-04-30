import SwiftUI
import Combine
import Nuke
import NukeUI

struct SplashView: View {
    @Binding var splashCompleted: Bool
    @Environment(\.dependencies.tasks) var tasks
    @Environment(\.dependencies.state.themeConfigurationState.themeConfiguration) var themeConfiguration
    @Environment(\.theme) var theme
    
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                ZStack {
                    if let logoUrl = themeConfiguration?.settings?.themeImages?.logoUrl,
                       let url = URL(string: logoUrl) {
                        
                        Group {
                            LazyImage(url: url, content: { state in
                                if let image = state.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding(16)
                                } else {
                                    defaultLogo()
                                }
                            })
                        }
                    }
                    else {
                        defaultLogo()
                    }
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
        .onAppear {
            fetchThemeConfiguration()
        }
    }
    
    private func defaultLogo() -> some View  {
        theme.icons.base.brand
            .resizable()
            .frame(width: 80, height: 80)
            .padding(16)
    }
    
    private func fetchThemeConfiguration() {
        tasks.initialize(GetThemeConfigurationTask.self)
            .execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                switch response {
                case .finished:
                    print("fech theme confi", response)
                case .failure(let error):
                    _ = error
                }
                }, receiveValue: { response in
                })
            .store(in: &cancellables)
    }
}


#Preview  {
    SplashView(splashCompleted: .constant(false))
}
