import XCTest

extension XCUIApplication {
    convenience init(appleBundleID: AppleBundleIdentifiers) {
        self.init(bundleIdentifier: appleBundleID.rawValue)
    }
}
