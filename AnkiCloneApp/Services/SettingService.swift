final class SettingService {
    static let shared: SettingService = .init()
    private init() {}

    var storage: Storage?
}
