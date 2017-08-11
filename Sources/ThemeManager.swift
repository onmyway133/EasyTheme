
import Foundation

/// Manager your current theme
public class ThemeManager {

  /// This is the current theme. Set it at app launch and whenever you want 
  /// to change theme
  public static var currentTheme: Theme? {
    didSet {
      NotificationCenter.default.post(name: Notification.Name.themeDidChange, object: self)
    }
  }
}
