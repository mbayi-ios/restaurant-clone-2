/**
 Is initialized with `Repositories` and is used to `initialize` `Tasks` and
 inject them with the appropriate `Repository` for use
 
 */
struct Tasks {
    private let repositories: Repositories
    
    init(repositories: Repositories) {
        self.repositories = repositories
    }
    /**
     Returns a `Task` for the type provided, injected with the `Repository` for the `Task`
     */
    func initialize<T: Task>(_ type: T.Type) -> T {
        let repository = repositories.resolve(T.RepositoryType.self)
        return T(repository: repository)
    }
}
