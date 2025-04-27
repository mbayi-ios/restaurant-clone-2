import SwiftUI
import Combine

struct HomeView: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.dependencies.tasks) var tasks
    
    
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        BaseNavigationView {
            VStack() {
                Text("Home Page View")
                    .foregroundColor(.red)
            }
            .onAppear {
                fetchThemeConfiguration()
            }
        }
        .padding(.top, 16)
        .background(theme.colors.surfaceDefault.backgroundColor)
        .navigationViewStyle(StackNavigationViewStyle())
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
