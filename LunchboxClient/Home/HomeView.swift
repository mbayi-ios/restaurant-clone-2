import SwiftUI
import Combine

struct HomeView: View {
    
    @Environment(\.dependencies.tasks) var tasks
    
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        VStack() {
            Text("Home Page View")
        }
        .onAppear {
            fetchThemeConfiguration()
        }
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
