final class DeckService {
    private let shared: DeckService = .init()
    private init() {}

    var storage: Storage?
}
