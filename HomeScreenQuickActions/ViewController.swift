//
//  ViewController.swift
//  HomeScreenQuickActions
//
//  Created by 長谷川瞬哉 on 2016/03/30.
//  Copyright © 2016年 長谷川瞬哉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HomeScreenQuickActionsDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		HomeScreenQuickActions.sharedInstance.delegate = self
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.notinoti(_:)), name: "noti", object: nil)
	}
	
	func notinoti(noti: NSNotification) {
		print("\(noti.userInfo!["shortCutItem"])")
	}
	
	func shortCutItemDidSelectAtIndex(shortcutItem: UIApplicationShortcutItem, index: Int) {
		
		for item in self.view.subviews {
			item.removeFromSuperview()
		}
		
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
		label.text = "\(index)"
		label.backgroundColor = UIColor.lightGrayColor()
		label.textAlignment = .Center
		self.view.addSubview(label)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

