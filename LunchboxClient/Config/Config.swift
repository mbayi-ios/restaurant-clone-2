import Foundation
class Config {
    enum Property: String {
        case hostUrl = "Host URL"
        case tenant = "Tenant"
        case headerFontName = "Header Font Name"
        case bodyFontName = "Body Font Name"
    }
    
    static let shared = Config()
    
    private var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    var tenant: String {
        return propertyString(forKey: .tenant)
    }
  
    var hostUrl: String {
        return propertyString(forKey: .hostUrl)
    }
    
    var headerFontName: String? {
        return safePropertyString(forKey: .headerFontName)
    }
    
    var bodyFontName: String? {
        return safePropertyString(forKey: .bodyFontName)
    }
    
    private func safePropertyString(for givenBundle: Bundle? = nil, forKey key: Property) -> String? {
        guard let string = (givenBundle ?? bundle).object(forInfoDictionaryKey: key.rawValue) as? String else {
            return nil
        }
        
        return string.replacingOccurrences(of: "\\n", with: "\n")
    }
    
    private func propertyString(for givenBundle: Bundle? = nil, forKey key: Property) -> String {
        guard let string = safePropertyString(for: givenBundle, forKey: key) else {
            fatalError("Info dictionary must specify a String for key \"\(key)\".")
        }
        
        return string
    }
}

extension Config {
    func printAllConfigProperties() {
        print("Host URL: \(hostUrl)")
    }
}
