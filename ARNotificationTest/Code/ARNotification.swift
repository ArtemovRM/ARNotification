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
			let frame = self.expectedFrame() else {
			print("ARNotification error: window not set!")
				
			return
		}
		
		let view = ARNotificationShadowWrapperView<ARNotificationView>(frame: frame)
		view.insideView.colors = settings.colors
		view.insideView.setNotification(type: type, title: title)
		
		window.addSubview(view)
		
		let safeArea = window.safeAreaLayoutGuide
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: settings.minimumLRPadding).isActive = true
		view.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -settings.minimumLRPadding).isActive = true
		view.heightAnchor.constraint(equalToConstant: settings.minimumHeight).isActive = true

		switch settings.position {
		case .bottom:
			let bottomConstraint = view.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
			bottomConstraint.isActive = true
			
			bottomConstraint.constant = -self.settings.minimumPadding
			
			animateNotificationView(view: view, constraint: bottomConstraint)
			
		case .top:
			let topConstraint = view.topAnchor.constraint(equalTo: safeArea.topAnchor)
			topConstraint.isActive = true
			
			topConstraint.constant = self.settings.minimumPadding
			animateNotificationView(view: view, constraint: topConstraint)
		}
	}
	
	private func animateNotificationView(view: UIView, constraint: NSLayoutConstraint) {
		UIView.animate(withDuration: settings.duration, animations: { [unowned self] in
			self.window?.layoutIfNeeded()
		}, completion: { [weak view] _ in
			DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.waiting, execute: {
				constraint.constant = -constraint.constant
				UIView.animate(withDuration: self.settings.duration, animations: {
					self.window?.layoutIfNeeded()
				}, completion: { _ in
					view?.removeFromSuperview()
				})
			})
		})
	}
	
	private func expectedFrame() -> CGRect? {
		guard let window = self.window,
			let width = window.rootViewController?.view.frame.size.width,
			let height = window.rootViewController?.view.frame.size.height else {
			
			return nil
		}
		
		let safeInsets = window.safeAreaInsets
		
		return CGRect(x: safeInsets.left + settings.minimumLRPadding,
					  y: settings.position == .bottom ? height : -settings.minimumPadding,
					  width: width - (safeInsets.left + (settings.minimumLRPadding * 2) + safeInsets.right),
					  height: settings.minimumHeight)
	}
}

