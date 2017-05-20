import Foundation

public protocol Themeable: class {

}


public extension Themeable {
  func theme<T: Theme>(_ type: T.Type, apply: (Self, T) -> Void) {
    if let theme = Manager.theme as? T {
      apply(self, theme)
    }
  }

  fileprivate var theme_handler: Handler {
    if let handler = objc_getAssociatedObject(self, &key) as? Handler {
      return handler
    } else {
      let handler = Handler()
      objc_setAssociatedObject(self, &key, handler, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return handler
    }
  }
}

extension NSObject: Themeable {}

fileprivate struct AssociatedKeys {
  static var key = "handler"
}

fileprivate var key = "handler"

fileprivate class Handler {
  let observer: NSObjectProtocol

  var mapping = [String: (Themeable, Theme) -> Void]()

  init() {
    observer = NotificationCenter.default.addObserver(
      forName: Manager.themeChangeNotification,
      object: Manager.self,
      queue: OperationQueue.main,
      using: { notification in

    })
  }

  deinit {
    NotificationCenter.default.removeObserver(observer)
  }
}
