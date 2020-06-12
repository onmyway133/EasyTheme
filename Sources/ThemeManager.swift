
import Foundation

/// Manager your current theme
@objc
@objcMembers
public class ThemeManager: NSObject {

  /// The singleton
  public static let shared = ThemeManager()

  /// This is the current theme. Set it at app launch and whenever you want 
  /// to change theme
  public var currentTheme: Theme? {
    didSet {
      NotificationCenter.default.post(name: Notification.Name.themeDidChange, object: self)
    }
  }
}
