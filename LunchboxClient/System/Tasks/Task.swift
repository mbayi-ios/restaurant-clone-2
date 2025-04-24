import Foundation
import Combine

// MARK: - Task

/**
 A `Task` acts as an abstraction between `Repositories` and the object that would like
 to access them (i.e ViewModel). This way, even if the source of the `Repository` changes
 (i.e Changes API endpoints, models, Core data etc) the object that will be accessing the data from
 that `Repository` won't need to change. Instead, the `Task` acts as the layer in between
 */
protocol Task {
    associatedtype RepositoryType: Repository
    
    init(repository: RepositoryType)
}

/// A `Task` which leverage on `AnyPublisher` for its `execute()` return
protocol TaskCombine {
    associatedtype CombineResponse
}

// MARK: - Noninjectable

/// A Task which does not require any parameters for `execute()`
protocol TaskNoninjectable: Task {
    func execute()
}

/**
 A Task which does not require any parameters for `execute()` adn will leverage
 an `AnyPublisher` for its `execute()` return
 */
protocol TaskCombineNoninjectable: Task, TaskCombine {
    func execute() -> AnyPublisher<CombineResponse, Error>
}
// MARK: - Injectable
/**
 A protocol which is used on a `Task` to indicate what type the parameters
 of its `execute()` function will be
 */
protocol TaskModelInjectable: Task {
    associatedtype Model
}

/**
 A `Task` which requires parameters for `execute()`
 */
protocol TaskInjectable: TaskModelInjectable {
    func execute(with object: Model)
}

/**
 A `Task` which requires parameters for `execute()` and will leverage
 an `AnyPublisher for its `execute()` return
 */

protocol TaskCombineInjecable: TaskModelInjectable, TaskCombine {
    func execute(with object: Model) -> AnyPublisher<CombineResponse, Error>
}
