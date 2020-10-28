import UIKit
import Foundation

protocol Fakeable {
    associatedtype T
    static var defaultFakeValue: T { get }
}

extension Fakeable {
    static func fake(value: T = defaultFakeValue) -> T {
        return value
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

print(Bool.fake())
print(Double.defaultFakeValue)
print(Double.fake())
