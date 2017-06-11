import Foundation

/// Anything that wants to use theme
public protocol ThemeUser: class {}

public extension ThemeUser {

  /// Specify the theme you want to use.
  /// This is called immediately and when current theme changes
  ///
  /// Usage
  /// ```
  /// textField.theme(MyTheme.self) {
  ///   $0.textColor = $1.mainColor
  ///   $0.font = $1.textFont
  /// }
  /// ```
  ///
  /// - Parameters:
  ///   - type: The type of your own theme
  ///   - apply: the function that gets called with (ThemeUser, Theme)
  func use<T: Theme>(_ type: T.Type, apply: @escaping (Self, T) -> Void) {
    if let theme = ThemeManager.currentTheme as? T {
      apply(self, theme)
    }

    theme_handler.mapping[String(describing: type.self)] = { (themeUser: ThemeUser, theme: Theme) in
      guard let themeUser = themeUser as? Self,
        let theme = theme as? T else {
          return
      }

      apply(themeUser, theme)
    }
  }

  fileprivate var theme_handler: Handler {
    if let handler = objc_getAssociatedObject(self, &key) as? Handler {
      return handler
    } else {
      let handler = Handler(host: self)
      handler.observe()
      objc_setAssociatedObject(self, &key, handler, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return handler
    }
  }
}

/// MARK: - NSObject 

extension NSObject: ThemeUser {}

// MARK: - Associated Object

fileprivate var key = "theme_handler"
