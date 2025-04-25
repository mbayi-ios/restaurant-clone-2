import Foundation
import Combine

class ThemeConfigurationRepository: Repository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getThemeConfiguration() -> AnyPublisher<ThemeConfiguration, Error> {
       
        let request = GetThemeConfigurationRequest()
        
        return client.perform(request).tryMap { response in
            let configuration = ThemeConfiguration(response: response.data)
            
            print("hello: \(configuration)")
            return configuration
            
        }.eraseToAnyPublisher()
    }
}
