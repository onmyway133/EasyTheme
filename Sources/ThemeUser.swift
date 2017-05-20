import Foundation

/// Conform to ThemeUser and use `theme` to apply the theme
public protocol ThemeUser: class {}

public extension ThemeUser {

  /// Specify the theme you want o use
  func theme<T: Theme>(_ type: T.Type, apply: @escaping (Self, T) -> Void) {
    if let theme = Manager.theme as? T {
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

fileprivate struct AssociatedKeys {
  static var key = "handler"
}

fileprivate var key = "handler"

// MARK: - Handler

fileprivate class Handler {
  var observer: NSObjectProtocol!

  weak var host: ThemeUser?
  var mapping = [String: (ThemeUser, Theme) -> Void]()

  init(host: ThemeUser) {
    self.host = host
  }

  func observe() {
    observer = NotificationCenter.default.addObserver(
      forName: Manager.themeChangeNotification,
      object: Manager.self,
      queue: OperationQueue.main,
      using: { [weak self] _ in
        self?.handle()
    })
  }

  func handle() {
    guard let host = host else {
      return
    }

    guard let theme = Manager.theme else {
      return
    }

    guard let action = mapping[String(describing: type(of: theme))] else {
      return
    }

    action(host, theme)
  }

  deinit {
    NotificationCenter.default.removeObserver(observer)
  }
}
