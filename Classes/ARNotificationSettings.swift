//
//  ARNotificationSettings.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 26/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

/// Настройки уведомлений
public struct ARNotificationSettings {
	
    public init() {}
    
	/// Минимальная высота уведомления
	public var minimumHeight: CGFloat = 66.0
	
	/// Минимальный отступ
	public var minimumPadding: CGFloat = 80
	
	/// Минимальный отступ от краев
	public var minimumLRPadding: CGFloat = 8.0
	
	/// Время исполнения анимации(в одну сторону)
	public var duration: Double = 0.5
	
	/// Время ожидания
	public var waiting: Double = 2.0
	
	/// Позиция, откуда будут исходить уведомления
	public var position: ARNotificationPosition = .top
	
	/// Цвета в соотношении с типом уведомлений
	public var colors: [ARNotificationType: UIColor] = [.info: .blue,
												 .error: .red,
												 .warning: .orange,
												 .success: .green]
}

public enum ARNotificationPosition {
	case top
	case bottom
}

