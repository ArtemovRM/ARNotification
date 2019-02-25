//
//  ARNotificationWrapperView.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

class ARNotificationWrapperView: UIView {
	
	let radius: CGFloat = 4
	
	var colors: [ARNotificationType:UIColor]! {
		didSet {
			notificationView.colors = self.colors
		}
	}
	
	private var notificationView: ARNotificationView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		initView()
	}
	
	func setNotification(type: ARNotificationType, title: String) {
		notificationView.setNotification(type: type, title: title)
	}
	
	private func initView() {
		notificationView = ARNotificationView(frame: bounds)
		addSubview(notificationView)
		
		defaultSettings()
	}
	
	private func defaultSettings() {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
		layer.shadowOffset = CGSize.zero
		layer.shadowOpacity = 0.4
		layer.shadowRadius = 6
		layer.shouldRasterize = true
		layer.rasterizationScale = UIScreen.main.scale
	}
}

