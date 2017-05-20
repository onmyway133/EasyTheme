import Foundation

public class Manager {
  static let themeChangeNotification = Notification.Name("themeChangeNotification")

  public static var theme: Themeable? {
    didSet {
      NotificationCenter.default.post(name: themeChangeNotification, object: self)
    }
  }
}
