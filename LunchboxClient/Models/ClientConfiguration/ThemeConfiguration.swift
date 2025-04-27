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
        
        struct ThemeImages: Codable {
            let logoUrl: String?
            let wordmark: String?
            let startOrderPageImage: String?
            let giftCardImage: String?
        }
        
        struct PopUp: Codable {
            let body: String?
            let header: String?
            let enable: Bool?
            let showOnce: Bool?
            let imageUrl: String?
        }
        
        let themeImages: ThemeImages?
        let hubMarketing: [HubMarketing]?
        let popUp: PopUp?
    }
    
    var id: String {
        return tenantId
    }
    
    let tenantId: String
    let settings: Settings?
}
