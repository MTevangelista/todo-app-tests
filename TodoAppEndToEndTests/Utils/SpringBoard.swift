import XCTest

/// A singleton representing iOS's homescreen application.
///
/// Can be used to perform automated tasks outside of your own app.
final class Springboard {
    static let springboard = XCUIApplication(appleBundleID: .springboard)
    static let appName = "TodoApp"
    
    private init() {}

    /// Delete the app via springboard
    ///
    /// Note: Tested only on iOS 16. It SHOULD work on iOS 15 and potentially iOS 14 as well
    class func deleteApp() {
        XCUIApplication().terminate()

        let appIcon = springboard.icons[appName]
        
        guard appIcon.waitForExistence(timeout: 1) else {
            return
        }
        
        // long press the app icon to reveal the context menu
        appIcon.press(forDuration: 1.3)

        // tap the remove app button from the context menu
        springboard.buttons["Remove App"].tap()

        // tap delete app button after the alert appears
        let deleteAppButton = springboard.alerts.buttons["Delete App"]

        if deleteAppButton.waitForExistence(timeout: 1) {
            deleteAppButton.tap()
        } else {
            fatalError("Failed to delete app. Could not find Delete App Button")
        }

        // tap confirm delete button after the alert appears
        let confirmDeleteButton = springboard.alerts.buttons["Delete"]

        if confirmDeleteButton.waitForExistence(timeout: 1) {
            confirmDeleteButton.tap()
        } else {
            fatalError("Failed to delete app. Could not find confirm deletion button")
        }
    }
}


//final class SpringBoard {
//    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
//    
//    class func deleteApp() {
//        XCUIApplication().terminate()
//        springboard.activate()
//        
//        let appIcon = springboard.icons.matching(identifier: "TodoApp").firstMatch
//        appIcon.press(forDuration: 1.3)
//        
//        let _ = springboard.buttons["Remove App"].waitForExistence(timeout: 1.0)
//        springboard.buttons["Remove App"].tap()
//        
//        let deleteButton = springboard.alerts.buttons["Delete App"].firstMatch
//        
//        if deleteButton.waitForExistence(timeout: 5) {
//            deleteButton.tap()
//            springboard.alerts.buttons["Delete"].tap()
//        }
//    }
//}
