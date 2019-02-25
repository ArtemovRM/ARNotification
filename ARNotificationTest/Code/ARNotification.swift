//
//  ARNotification.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

import UIKit

enum ARNotificationType {
	case error
	case success
	case warning
	case info
}

enum ARNotificationPosition {
	case top
	case bottom
}

struct ARNotificationSettings {
	
	// Минимальная высота уведомления
	var minimumHeight: CGFloat = 66.0
	
	// Минимальный отступ
	var minimumPadding: CGFloat = 180
	
	// Минимальный отступ от краев
	var minimumLRPadding: CGFloat = 16.0
	
	// Время исполнения анимации(в одну сторону)
	var duration: Double = 0.5
	
	// Позиция, откуда будут исходить уведомления
	var position: ARNotificationPosition = .bottom
	
	// Цвета в соотношении с типом уведомлений
	var colors: [ARNotificationType: UIColor] = [.info: .blue, .error: .red, .warning: .orange, .success: .green]
}

class ARNotification {
	
	static let shared = ARNotification()
	
	// Окно, в которое пушим уведомления
	weak var window: UIWindow?
	
	// Настройки
	var settings: ARNotificationSettings = ARNotificationSettings()
	
	private init() { }
	
	func push(type: ARNotificationType, title: String) {
		let width = window!.rootViewController!.view.frame.size.width
		let height = window!.rootViewController!.view.frame.size.height
		
		let frame = CGRect(x: settings.minimumLRPadding,
						   y: height + 20,
						   width: width - (settings.minimumLRPadding * 2),
						   height: settings.minimumHeight)
		
		let view = ARNotificationWrapperView(frame: frame)
		view.colors = settings.colors
		view.setNotification(type: type, title: title)
		
		self.window?.addSubview(view)
		
		UIView.animate(withDuration: settings.duration, animations: { [unowned self] in
			view.frame.origin.y = height - self.settings.minimumPadding
			
			self.window?.layoutIfNeeded()
			}, completion: { [weak view] _ in
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
					UIView.animate(withDuration: self.settings.duration, animations: {
						view?.frame.origin.y = height + 20
					}, completion: { _ in
						view?.removeFromSuperview()
					})
				})
		})
	}
}

