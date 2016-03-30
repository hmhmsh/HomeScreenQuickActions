//
//  HomeScreenQuickActions.swift
//  3Dtouch
//
//  Created by hmhm on 2016/03/29.
//  Copyright © 2016年 hmhm. All rights reserved.
//

import Foundation
import UIKit


protocol HomeScreenQuickActionsDelegate {
	func shortCutItemDidSelectAtIndex(shortcutItem: UIApplicationShortcutItem, index: Int)
}

class HomeScreenQuickActions: NSObject {
	
	static let sharedInstance = HomeScreenQuickActions()
	
	var delegate: HomeScreenQuickActionsDelegate?
	var shortCutItems = [UIMutableApplicationShortcutItem]()
	
	private override init() {
		super.init()
	}
	
	func addShortCutItem(type: String, localizedTitle: String, localizedSubtitle: String?, icon: UIApplicationShortcutIcon?, userInfo: [NSObject : AnyObject]?) -> Bool {
		
		if shortCutItems.count > 4 {
			return false
		}
		
		var info = userInfo
		info!["tag"] = shortCutItems.count
		
		let shortItem = UIMutableApplicationShortcutItem(type: type, localizedTitle: localizedTitle, localizedSubtitle: localizedSubtitle, icon: icon, userInfo: info)
		
		shortCutItems.append(shortItem)
		
		return true
	}

	func delegateMethod(application: UIApplication, shortCutItem: UIApplicationShortcutItem) {
		
		for index in 0..<shortCutItems.count {
			let tag = shortCutItem.userInfo!["tag"] as! Int
			if tag == index {
				delegate?.shortCutItemDidSelectAtIndex(shortCutItem, index: index)
			}
		}
	}
	
	func notificationMethod(application: UIApplication, shortCutItem: UIApplicationShortcutItem, notificationName: String) {
		let object = ["application": application, "shortCutItem": shortCutItem]
		NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: nil, userInfo: object)
	}
	
}