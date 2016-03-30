# HomeScreenQuickActions

#Usage

    AppDelegate.swift
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
        let homeActions = HomeScreenQuickActions.sharedInstance
		
        homeActions.addShortCutItem("type", localizedTitle: "title", localizedSubtitle: "subTitle", icon: UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.xx), userInfo: ["":""])

        UIApplication.sharedApplication().shortcutItems = homeActions.shortCutItems
		
        return true
    }

    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
    
        // for delegate
        HomeScreenQuickActions.sharedInstance.delegateMethod(application, shortCutItem: shortcutItem)
    
        // for notification
        HomeScreenQuickActions.sharedInstance.notificationMethod(application, shortCutItem: shortcutItem, notificationName: "notificationName")
    }

delegate

    xx.swift
        
    HomeScreenQuickActions.sharedInstance.delegate = self
    
    func shortCutItemDidSelectAtIndex(shortcutItem: UIApplicationShortcutItem, index: Int) {
    }

Notification

    xx.swift

    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(xx.xx(_:)), name: "noticationName", object: nil)
