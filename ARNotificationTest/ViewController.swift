//
//  ViewController.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var notification = ARNotification.shared
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func errorClicked() {
		notification.push(type: .error, title: "Невозможно получить данные с сервера Проверьте соединение с интернетом")
	}
	
	@IBAction func successClicked() {
		notification.push(type: .success, title: "Успех успехов")
	}
	
	@IBAction func infoClicked() {
		notification.push(type: .info, title: "Информационное уведомление")
	}
	
	@IBAction func warningClicked() {
		notification.push(type: .warning, title: "Внимание! спасибо за внимание")
	}
}

