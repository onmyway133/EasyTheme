import Foundation

/// Manager your current theme
public class Manager {
  static let themeChangeNotification = Notification.Name("themeChangeNotification")

  /// Must declare a current theme at app launch
  public static var theme: Theme? {
    didSet {
      NotificationCenter.default.post(name: themeChangeNotification, object: self)
    }
  }
}
