//
//  ARNotification.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

public class ARNotification {
	
	public static let shared = ARNotification()
	
	// Окно, в которое пушим уведомления
    public weak var window: UIWindow? {
        didSet {
            queue.window = window
        }
    }
	
	// Настройки
    public var settings: ARNotificationSettings? {
        didSet {
            queue.settings = settings
        }
    }
	
    private var queue = ARNotificationQueue()
    
	private init() {
        queue.settings = ARNotificationSettings()
    }
	
	public func push(type: ARNotificationType, title: String) {
        queue.append(type: type, title: title)
	}
}

