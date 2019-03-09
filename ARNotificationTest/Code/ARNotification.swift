//
//  ARNotification.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

class ARNotification {
	
	static let shared = ARNotification()
	
	// Окно, в которое пушим уведомления
	weak var window: UIWindow?
	
	// Настройки
	var settings: ARNotificationSettings = ARNotificationSettings()
	
	private init() { }
	
	func push(type: ARNotificationType, title: String) {
		guard let window = self.window,
			let width = window.rootViewController?.view.frame.size.width,
			let height = window.rootViewController?.view.frame.size.height else {
			print("ARNotification error: window not set!")
				
			return
		}
		
		let frame = CGRect(x: settings.minimumLRPadding,
						   y: height,
						   width: width,
						   height: settings.minimumHeight)
		
		let view = ARNotificationShadowWrapperView<ARNotificationView>(frame: frame)
		view.insideView.colors = settings.colors
		view.insideView.setNotification(type: type, title: title)
		
		window.addSubview(view)
		
		view.translatesAutoresizingMaskIntoConstraints = false
		let bottomConstraint = view.bottomAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor)
		bottomConstraint.isActive = true
		
		view.leftAnchor.constraint(equalTo: window.safeAreaLayoutGuide.leftAnchor, constant: settings.minimumLRPadding).isActive = true
		view.rightAnchor.constraint(equalTo: window.safeAreaLayoutGuide.rightAnchor, constant: -settings.minimumLRPadding).isActive = true
		view.heightAnchor.constraint(equalToConstant: settings.minimumHeight).isActive = true
		
		bottomConstraint.constant = -self.settings.minimumPadding
		
		UIView.animate(withDuration: settings.duration, animations: { [unowned self] in
			self.window?.layoutIfNeeded()
		}, completion: { [weak view] _ in
			DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
				bottomConstraint.constant = self.settings.minimumPadding
				UIView.animate(withDuration: self.settings.duration, animations: {
					self.window?.layoutIfNeeded()
				}, completion: { _ in
					view?.removeFromSuperview()
				})
			})
		})
	}
}

