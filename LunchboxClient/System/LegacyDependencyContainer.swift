import SwiftUI

struct DependencyContainer: EnvironmentKey {
    
    let tasks: Tasks
    
    static var defaultValue: Self { Self.default }
    
    
    
    private static var `default`: Self = {
        let context = NovaDineMessageContext()
        let client = HTTPClient(context: context)
        
        // It is important to make sure that `Repositories` is initialized
        // and registers every `Repository` that will be used by a Task in
        // the application. Otherwise, if a `Repository` is not registered and
        // is attempted to be accessed by a `Task`, then the app will crash. As new
        // repositories are created, add them here
        
        let repositories = Repositories()
        repositories.register(ThemeConfigurationRepository(client: client))
        return Self(
            tasks: Tasks(repositories: repositories)
            )
    }()
}


extension EnvironmentValues {
    var dependencies: DependencyContainer {
        get { self[DependencyContainer.self ]}
        set { self[DependencyContainer.self] = newValue }
    }
}
