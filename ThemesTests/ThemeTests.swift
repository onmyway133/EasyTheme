import XCTest
@testable import Themes

class ThemeTests: XCTestCase {

  class MyTheme: Theme {
    let color = UIColor.red
    let font = UIFont.systemFont(ofSize: 12)
    let placeholder = "placeholder"
  }

  func testExample() {
    Manager.theme = MyTheme()

    let label = UILabel()
    label.theme(MyTheme.self) {
      $0.textColor = $1.color
      $0.font = $1.font
      $0.text = $1.placeholder
    }

    XCTAssertEqual(label.text, "placeholder")
  }
}
