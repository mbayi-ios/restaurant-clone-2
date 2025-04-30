import SwiftUI

struct DependencyContainer: EnvironmentKey {
    
    let tasks: Tasks
    let state: AppState
    
    static var defaultValue: Self { Self.default }
    
    private static var `default`: Self = {
        let context = NovaDineMessageContext()
        let client = HTTPClient(context: context)
        
        let themeConfigurationStore = ThemeConfigurationStore()
        // It is important to make sure that `Repositories` is initialized
        // and registers every `Repository` that will be used by a Task in
        // the application. Otherwise, if a `Repository` is not registered and
        // is attempted to be accessed by a `Task`, then the app will crash. As new
        // repositories are created, add them here
        
        let repositories = Repositories()
        repositories.register(ThemeConfigurationRepository(client: client, store: themeConfigurationStore))
        return Self(
            tasks: Tasks(repositories: repositories),
            state: AppState(themeConfigurationStore: themeConfigurationStore)
            )
    }()
}


extension EnvironmentValues {
    var dependencies: DependencyContainer {
        get { self[DependencyContainer.self ]}
        set { self[DependencyContainer.self] = newValue }
    }
}
