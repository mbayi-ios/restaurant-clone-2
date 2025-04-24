import Foundation

extension HTTPClient {
    enum HTTPClientError: LocalizedError {
        case unknown(statusCode: Int, data: Data)
        case invalidBaseUrl
        case invalidBody
    }
}
