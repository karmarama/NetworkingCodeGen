import Foundation
import Networking

protocol Fakeable {
    associatedtype T
    static var defaultFakeValue: T { get }
}

extension Fakeable {
    static func fake(value: T = defaultFakeValue) -> T {
        return value
    }
}

extension Networking.Empty: Fakeable {
    static var defaultFakeValue: Networking.Empty {
        let decoder = EmptyDecoder()
        guard let empty = try? decoder.decode(Empty.self, from: nil, response: HTTPURLResponse()) else {
            fatalError("unable to construct fake empty")
        }
        return empty
    }
}

extension Double: Fakeable {
    static var defaultFakeValue: Double {
        return 0.1
    }
}

extension String: Fakeable {
    static var defaultFakeValue: String {
        return "test"
    }
}

extension Int: Fakeable {
    static var defaultFakeValue: Int {
        return 1
    }
}

extension Int64: Fakeable {
    static var defaultFakeValue: Int64 {
        return 1
    }
}

extension Data: Fakeable {
    static var defaultFakeValue: Data {
        return Data()
    }
}

extension Date: Fakeable {
    static var defaultFakeValue: Date {
        return Date.makeFake()
    }

    static func makeFake(year: Int = 2018,
                         month: Int = 1,
                         day: Int = 1,
                         hour: Int = 9,
                         min: Int = 30,
                         sec: Int = 0) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: min, second: sec)
        return calendar.date(from: components)!
    }
}

extension Bool: Fakeable {
    static var defaultFakeValue: Bool {
        return true
    }
}

extension Array: Fakeable where Element: Fakeable {
    static var defaultFakeValue: [Element] {
        guard let element = Element.defaultFakeValue as? Element else { fatalError("can't construct element from fake")}
        return [element]
    }
}

extension Dictionary: Fakeable where Key: Fakeable, Value: Fakeable {
    static var defaultFakeValue: [Key: Value] {
        guard let key = Key.defaultFakeValue as? Key,
              let value = Value.defaultFakeValue as? Value else {
            fatalError("can't construct key/value from fake")}
        return [key: value]
    }
}

