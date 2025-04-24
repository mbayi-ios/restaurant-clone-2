
/**
Stores all the `Repositories` so this way they can be persisted and accessed later elsewhere
 **/

class Repositories {
    private var repositories =  [String: Repository]()
    
    /// stores the `Repository` so that it can be persisted and accessed later via the `DependencyContainer`
    func register<R: Repository>(_ repository: R) {
        repositories["\(R.self)"] = repository
        
    }
    
    /**
    Stores the `Repository` so it can be persisted and accessed later via the `DependencyContainer`
    Make sure that the resporisory is registered with the Repositories inside the DependencyContainer
     before attempting to resolve, because if is force casted after fetch from `repositories`
     */
    
    func resolve<R: Repository>(_ repositoryType: R.Type) -> R {
        guard let repository = repositories["\(R.self)"] as? R else {
            fatalError("Attempting to access a repository that hasnt been registered inside DependencyContainer.")
        }
        
        return repository
    }
    
}
