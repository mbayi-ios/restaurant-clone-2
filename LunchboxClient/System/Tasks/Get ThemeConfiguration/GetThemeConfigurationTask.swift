import Foundation
import Combine

struct GetThemeConfigurationTask: TaskCombineNoninjectable {
    typealias Model = String
    typealias RepositoryType = ThemeConfigurationRepository
    typealias CombineResponse = ThemeConfiguration
    
    private let repository: RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<ThemeConfiguration, any Error> {
        repository.getThemeConfiguration()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
