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
    label.theme(MyTheme.self) { label, theme in
      label.textColor = theme.color
      label.font = theme.font
      label.text = theme.placeholder
    }

    XCTAssertEqual(label.text, "placeholder")
  }
}
