import Foundation

extension UserDefaults {
    func set(date: Date?, forKey key: String) {
        userDefaults.set(date, forKey: key)
    }
    
    func date(forKey key: String) -> Date? {
        return userDefaults.value(forKey: key) as? Date
    }
}

let userDefaults = UserDefaults.standard
userDefaults.set(date: Date(), forKey: "now")
print(userDefaults.date(forKey: "now") ?? "?")
