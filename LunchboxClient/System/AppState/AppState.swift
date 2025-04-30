struct AppState {
    let themeConfigurationStore: ThemeConfigurationStore
    
    let themeConfigurationState: ThemeConfigurationState
    
    init(themeConfigurationStore: ThemeConfigurationStore) {
        self.themeConfigurationStore = themeConfigurationStore
        
        self.themeConfigurationState = ThemeConfigurationState(themeConfigurationStore: themeConfigurationStore)
    }
}
