import Foundation

/// Manager your current theme
public class Manager {
  static let themeChangeNotification = Notification.Name("themeChangeNotification")

  /// This is the current theme. Set it at app launch and whenever you want 
  /// to change theme
  public static var theme: Theme? {
    didSet {
      NotificationCenter.default.post(name: themeChangeNotification, object: self)
    }
  }
}
