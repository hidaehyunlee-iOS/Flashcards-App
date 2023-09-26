final class SettingService {
    private let shared: SettingService = .init()
    private init() {}

    var storage: Storage?
}
