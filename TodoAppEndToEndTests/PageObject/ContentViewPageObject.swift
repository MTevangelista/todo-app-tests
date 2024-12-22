import XCTest

final class ContentViewPageObject {
    private var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var titleTextField: XCUIElement {
        app.textFields["titleTextField"]
    }
    
    var saveTaskButton: XCUIElement {
        app.buttons["saveTaskButton"]
    }
    
    var taskList: XCUIElement {
        app.collectionViews["taskList"]
    }
}
