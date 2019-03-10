//
//  ARNotificationSettings.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 26/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

/// Настройки уведомлений
struct ARNotificationSettings {
	
	/// Минимальная высота уведомления
	var minimumHeight: CGFloat = 66.0
	
	/// Минимальный отступ
	var minimumPadding: CGFloat = 80
	
	/// Минимальный отступ от краев
	var minimumLRPadding: CGFloat = 8.0
	
	/// Время исполнения анимации(в одну сторону)
	var duration: Double = 0.5
	
	/// Время ожидания
	var waiting: Double = 2.0
	
	/// Позиция, откуда будут исходить уведомления
	var position: ARNotificationPosition = .top
	
	/// Цвета в соотношении с типом уведомлений
	var colors: [ARNotificationType: UIColor] = [.info: .blue,
												 .error: .red,
												 .warning: .orange,
												 .success: .green]
}

enum ARNotificationPosition {
	case top
	case bottom
}

