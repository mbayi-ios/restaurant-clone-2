import Foundation
import Combine
import UIKit

class NovaDineMessageContext: HTTPMessageContextual {
    var scheme: URLScheme = .https
    var host = "\(Config.shared.tenant).\(Config.shared.hostUrl)"
}
