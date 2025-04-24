import Foundation

protocol HTTPEndpoint {
    var base: String { get }
    var location: String { get }
}

extension HTTPEndpoint {
    var endpoint: String {
        return "\(base)\(location)"
    }
}
