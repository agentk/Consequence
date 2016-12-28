#if os(iOS)

    import UIKit

    typealias ViewController = UIViewController

#else

    import Cocoa

    typealias ViewController = NSViewController

#endif
