import Foundation
import KeychainAccess

public final class MemoryManager: MemoryManagerProtocol {
    
    private var memoryStore = [String: Codable]()
    
    private enum UserDefaultsKeys: String, CaseIterable {
        case isGuest
        
        /// 保存方法
        var persistenceType: PersistenceType {
            switch self {
            default:
                return .memoryOnly
            }
        }
    }

    /// 保存されている値を取得する.
    private func get<T>(_ key: UserDefaultsKeys) -> T? where T: Codable {
        switch key.persistenceType {
        case .memoryOnly: return getFromMemory(key)
        case .userDefaults: return getFromUserDefaults(key)
        case .keychain: return getFromMemory(key)
        case .file: return getFromMemory(key)
        }
    }
    

    
    private func getFromUserDefaults<T>(_ key: UserDefaultsKeys) -> T? where T: Decodable {
        return getFromUserDefaults(MemoryManager.UserDefaultsKeys(rawValue: key.rawValue) ?? .isGuest)
    }
    
    private func getFromMemory<T>(_ key: UserDefaultsKeys) -> T? where T: Codable {
        return getFromMemory(rawKey: key.rawValue)
    }
    /// メモリ上に保存されている値を取得する.
    private func getFromMemory<T>(rawKey: String) -> T? where T: Codable {
        precondition(memoryStore[rawKey] is T?, "型'\(type(of: memoryStore[rawKey]))'は型'\(T.self)'へ変換できませんでした.")
        return memoryStore[rawKey] as? T
    }
    
    /// 指定した値を保存する.
    private func set<T>(_ newValue: T?, forKey key: UserDefaultsKeys) where T: Codable {
        switch key.persistenceType {
        case .memoryOnly: return setToMemory(newValue, forKey: key)
        case .userDefaults: return setToMemory(newValue, forKey: key)
        case .keychain: return setToMemory(newValue, forKey: key)
        case .file: return setToMemory(newValue, forKey: key)
        }
    }
    
    private func setToMemory<T>(_ newValue: T?, forKey key: UserDefaultsKeys) where T: Codable {
        setToMemory(newValue, forRawKey: key.rawValue)
    }

    /// 指定した値をメモリ上に保存する.
    private func setToMemory<T>(_ newValue: T?, forRawKey rawKey: String) where T: Codable {
        memoryStore[rawKey] = newValue
    }
    
    /// 永続化(保存)方法
     enum PersistenceType {
        /// メモリ上で保持するだけ
        case memoryOnly
        /// NSUserDefaults
        case userDefaults
        /// キーチェーン
        case keychain
        /// ファイル
        case file
    }
}

extension MemoryManager {
    /// シングルトンオブジェクト
    public static let shared = MemoryManager()
    
    /// 非ログイン(ゲスト)利用フラグ
    public var isGuest: Bool {
        get { return get(.isGuest) ?? false }
        set { set(newValue, forKey: .isGuest) }
    }
}
