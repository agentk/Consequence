#if os(iOS)

    import UIKit

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?

        func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
            
            return true
        }
        
    }


#else

    import Cocoa

    @NSApplicationMain
    class AppDelegate: NSObject, NSApplicationDelegate {

        func applicationDidFinishLaunching(_ aNotification: Notification) {
        }

        func applicationWillTerminate(_ aNotification: Notification) {
        }
    }

#endif
