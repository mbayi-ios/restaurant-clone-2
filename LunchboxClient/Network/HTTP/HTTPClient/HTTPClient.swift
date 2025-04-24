import Foundation
import Combine

protocol NetworkClient {
    func perform<Request: HTTPRequest>(_ request: Request) -> AnyPublisher<Request.Response, Error>
}

class HTTPClient: NetworkClient {
    private static let badRequestStatusCode = 400
    
    private let context: HTTPMessageContextual
    private let session: URLSession
    
    private let encoder = HTTPClientEncoder()
    private let decoder = HTTPClientDecoder()
    
    init(context: HTTPMessageContextual, session: URLSession = URLSession(configuration: .default)) {
        self.context = context
        self.session = session
        
    }
    
    func perform<Request: HTTPRequest>(_ request: Request) -> AnyPublisher<Request.Response, Error> {
        guard let url = getValidRequestURL(for: request) else {
            return Fail(error: HTTPClientError.invalidBaseUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        //urlRequest.allHTTPHeaderFields = getRequestHeaders(for: request)
        
        if let httpBody = request.body {
            do {
                urlRequest.httpBody = try encoder.encode(httpBody)
            } catch {
                return Fail(error: HTTPClientError.invalidBody).eraseToAnyPublisher()
            }
        }
        
        cancelDuplicateRequest(for: urlRequest)
        
        urlRequest.cUrlLogDebug()
        
        return execute(urlRequest)
            .decode(type: Request.Response.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    private func execute(_ request: URLRequest) -> AnyPublisher<Data, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap { [weak self](data, response) -> Data in
                
                guard let self = self, let httpResponse = response as? HTTPURLResponse else {
                    throw HTTPClientError.unknown(statusCode: HTTPClient.badRequestStatusCode, data: data)
                }
                
                let statusCode = httpResponse.statusCode
                
                guard 200..<300 ~= statusCode else {
                    throw self.errorInfo(from: data, statusCode: statusCode)
                }
                
                return data
            }
            .eraseToAnyPublisher()
    }
    
}

extension HTTPClient {
    private func getValidRequestURL<Request: HTTPRequest>(for request: Request) -> URL? {
        var components = URLComponents()
        components.path = request.path.endpoint
        
        let baseUrl = context.hostUrl
        return components.url(relativeTo: baseUrl)
    }
    
    private func errorInfo(from data: Data, statusCode: Int) -> Error {
        return HTTPClientError.unknown(statusCode: statusCode, data: data)
    }
    
    private func cancelDuplicateRequest(for urlRequest: URLRequest) {
        session.getAllTasks { tasks in
            if let task = tasks.first(where: {
                $0.originalRequest?.url == urlRequest.url &&
                $0.originalRequest?.httpMethod == urlRequest.httpMethod
            })
            {
                task.cancel()
            }
        }
    }
}

