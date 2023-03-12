import XCTest

final class MovieQuizUITests: XCTestCase {
    
    var app: XCUIApplication!
    

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()

        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app.terminate()
        app = nil
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testYesButton() {
        sleep(3)
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        app.buttons["Yes"].tap()
        sleep(3)
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        XCTAssertNotEqual(firstPosterData, secondPosterData)
    }
    
    func testNoButton() {
        sleep(3)
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        app.buttons["No"].tap()
        sleep(3)
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        XCTAssertNotEqual(firstPosterData, secondPosterData)
    }
    
    
    func testlndexLabelChange() {
        sleep(2)
        let oldIndexLabel = app.staticTexts["Index"].label
        app.buttons["Yes"].tap()
        sleep(2)
        let newIndexLabel = app.staticTexts["Index"].label
        XCTAssertNotEqual(oldIndexLabel, newIndexLabel)
    }
        
    func testEndOfTheRoundAlertAppear() {
        sleep(2)
        let alert = app.alerts["Game Results"]
        for _ in 1...10 {
            app.buttons["Yes"].tap()
            sleep(2)
        }
        XCTAssertTrue(alert.exists)
        XCTAssertEqual(alert.label, "Этот раунд окончен!")
        XCTAssertEqual(alert.buttons.firstMatch.label, "Сыграть еще раз")
    }
    
    func testAlertDismiss() {
        sleep(2)
        let alert = app.alerts["Game Results"]
        let alertButton = alert.buttons.firstMatch
        for _ in 1...10 {
            app.buttons["No"].tap()
            sleep(2)
        }
        alertButton.tap()
        XCTAssertFalse(alert.exists)
    }
}
