//
//  ARNotificationView.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

class ARNotificationView: UIView {
	
	@IBOutlet weak var typeNotificationView: UIView!
	@IBOutlet weak var title: UILabel!
	
	var colors: [ARNotificationType:UIColor]!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		initView()
	}
	
	func setNotification(type: ARNotificationType, title: String) {
		self.typeNotificationView.backgroundColor = colors[type]
		self.title.text = title
	}
	
	private func initView() {
		let bundle = Bundle(for: type(of: self))
		let nibName = type(of: self).description().components(separatedBy: ".").last!
		let nib = UINib(nibName: nibName, bundle: bundle)
		let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
		view.frame = self.bounds
		
		addSubview(view)
		
		defaultSettings()
	}
	
	private func defaultSettings() {
		layer.cornerRadius = 4.0
		layer.masksToBounds = true
	}
}

