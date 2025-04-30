import SwiftUI
import Combine

struct HomeView: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.dependencies.tasks) var tasks
    @Environment(\.dependencies.state.themeConfigurationState.themeConfiguration?.settings?.hubMarketing) var hubMarketing
    
    
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        BaseNavigationView {
            VStack(alignment: .leading) {
                headerSection()
                contentSection()
            }
            .onAppear {
                fetchThemeConfiguration()
            }
        }
        .padding(.top, 16)
        .background(theme.colors.surfaceDefault.backgroundColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func headerSection() -> some View {
        HStack {
            Text("Welcome")
                .formatted(font: .displayMedium, theme: theme)
                .padding(.top, 10)
        }
    }
    
    private func contentSection() -> some View {
        ScrollView {
            hubMarketingSection()
        }
    }
    
  
    @ViewBuilder
    private func hubMarketingSection() -> some View {
        
        if let hubMarketing = hubMarketing, !hubMarketing.isEmpty {
            VStack(spacing: 16) {
                
                ForEach(hubMarketing.indices, id: \.self) { index in
                    HomeHubContentView(hubMarketing: hubMarketing[index])
                }
            }
        }
    }
    
    private func cartSection() -> some View {
        theme.icons.system.cartFill
            .foregroundColor(theme.colors.surfaceDefault.textColor)
    }
    
    
    private func fetchThemeConfiguration() {
        tasks.initialize(GetThemeConfigurationTask.self)
            .execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                switch response {
                case .finished:
                    print("success: ", response)
                case .failure(let error):
                    _ = error
                }
            }, receiveValue: { response in
            })
            .store(in: &cancellables)
    }
}
