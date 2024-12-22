import XCTest

final class when_app_is_lauched: XCTestCase {
    
    private var app: XCUIApplication!
    private var pageObject: ContentViewPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        pageObject = ContentViewPageObject(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
    
    func test_should_not_display_any_tasks() {
        XCTAssertEqual(0, pageObject.taskList.cells.count)
    }
}

final class when_user_saves_a_new_task: XCTestCase {
    
    private var app: XCUIApplication!
    private var pageObject: ContentViewPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        pageObject = ContentViewPageObject(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
    
    func test_should_be_able_to_display_task_successfully() {
        pageObject.titleTextField.tap()
        pageObject.titleTextField.typeText("Mow the lawn")
        
        pageObject.saveTaskButton.tap()
        
        XCTAssertEqual(1, pageObject.taskList.cells.count)
    }
}