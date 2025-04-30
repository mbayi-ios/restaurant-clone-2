import Foundation
import Combine
import Nuke

class ThemeConfigurationState: ObservableObject {
    @Published private(set) var themeConfiguration: ThemeConfiguration?
    
    private var cancellables: Set<AnyCancellable> = []
    private let themeConfigurationStore: ThemeConfigurationStore
    
    init(themeConfigurationStore: ThemeConfigurationStore) {
        self.themeConfigurationStore = themeConfigurationStore
        
        themeConfigurationStore.themeConfiguration
            .receive(on: DispatchQueue.main)
            .sink { configuration in
                self.themeConfiguration = configuration
                
                self.prefetchImages()
            }.store(in: &cancellables)
    }
    
    private func prefetchImages() {
        var imagesForPrefetch = [URL]()
        print("print - images \(themeConfiguration?.settings?.hubMarketing ?? [])")
        if let hubMarketing = themeConfiguration?.settings?.hubMarketing {
            print("print - imagesss")
            let imageUrls: [URL] = hubMarketing.compactMap { item in
                guard let imageUrl = item.image else {
                    return nil
                }
                return URL(string: imageUrl)
            }
            imagesForPrefetch.append(contentsOf: imageUrls)
        }
        print("the images are", imagesForPrefetch)
    }
}
