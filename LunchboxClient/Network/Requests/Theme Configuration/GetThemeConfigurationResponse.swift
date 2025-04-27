import Foundation

struct GetThemeConfigurationResponse: Decodable {
    let data: AssetData?
}

struct AssetData: Codable {
    let tenant: String?
    let app_name: String
    let app_icon: AssetAppIcon
    let images: AssetImages?
    let hub_marketing: [AssetHubMarketing]?
    let pop_up: AssetPopUp?
}

struct AssetAppIcon: Codable {
    let background: URL?
    let foreground: URL?
    let composite: URL?
}

struct AssetImages: Codable {
    let logo: String?
    let wordmark: String?
    let gift_card_image: String?
    let start_order_page_image: String?
}

struct AssetPopUp: Codable {
    let body: String?
    let header: String?
    let enable: Bool?
    let show_once: Bool?
    let image: String?
}

struct AssetHubMarketing: Codable {
    let image: String?
    let title: String?
    let button_url: String?
    let button_text: String?
    let description: String?
}


extension ThemeConfiguration {
    init(response: AssetData?) {
        self.tenantId = response?.tenant ?? ""
        self.settings = Settings(response: response)
    }
}

extension ThemeConfiguration.Settings {
    init(response: AssetData?) {
        
        if let themeImages = response?.images {
            self.themeImages = ThemeImages(response: themeImages)
        } else {
            self.themeImages = nil
        }
        
        self.hubMarketing = response?.hub_marketing?.compactMap {HubMarketing(response: $0)}
        self.popUp = PopUp(response: response?.pop_up)
        
    }
}

extension ThemeConfiguration.Settings.ThemeImages {
    init(response: AssetImages) {
        self.logoUrl = response.logo
        self.startOrderPageImage = response.start_order_page_image
        self.giftCardImage = response.gift_card_image
        self.wordmark = response.wordmark
    }
}

extension ThemeConfiguration.Settings.PopUp {
    init(response: AssetPopUp?) {
        self.body = response?.body
        self.header = response?.header
        self.enable = response?.enable
        self.showOnce = response?.show_once
        self.imageUrl = response?.image
    
    }
}

extension ThemeConfiguration.Settings.HubMarketing {
    init(response: AssetHubMarketing) {
        self.image = response.image
        self.title = response.title
        self.buttonURL = response.button_url
        self.buttonText = response.button_text
        self.description = response.description
    }
}
