import Foundation

public protocol ThemeUser: class {

}


public extension ThemeUser {
  func theme<T: Theme>(_ type: T.Type, apply: @escaping (Self, T) -> Void) {
    if let theme = Manager.theme as? T {
      apply(self, theme)
    }

    theme_handler.mapping[String(describing: type.self)] = { (themeUser: ThemeUser, theme: Theme) in
      if let themeUser = themeUser as? Self,
        let theme = theme as? T {
        apply(themeUser, theme)
      }
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

extension NSObject: ThemeUser {}

fileprivate struct AssociatedKeys {
  static var key = "handler"
}

fileprivate var key = "handler"

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
    if let host = host,
      let theme = Manager.theme,
      let action = mapping[String(describing: type(of: theme))] {
      action(host, theme)
    }
  }

  deinit {
    NotificationCenter.default.removeObserver(observer)
  }
}
