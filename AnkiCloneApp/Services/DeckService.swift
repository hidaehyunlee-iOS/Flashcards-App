final class DeckService {
    static let shared: DeckService = .init()
    private init() {}

    var storage: Storage?
}
