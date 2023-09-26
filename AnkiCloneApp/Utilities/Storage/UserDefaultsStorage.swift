import Foundation

final class UserDefaultsStorage: Storage {
    static let shared: UserDefaultsStorage = .init()
    private init() {}

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func save<T: Encodable>(_ object: T, forKey key: String) {
        guard let data = try? encoder.encode(object) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }

    func load<T: Decodable>(forKey key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? decoder.decode(T.self, from: data)
    }

    func remove(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
