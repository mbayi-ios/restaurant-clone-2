import SwiftUI

struct ThemeConfiguration: Codable {
    struct Settings: Codable {
        struct HubMarketing: Codable {
            let image: String?
            let title: String?
            let buttonURL: String?
            let buttonText: String?
            let description: String?
        }
        
        let hubMarketing: [HubMarketing]?
    }
    
    let settings: Settings?
}
