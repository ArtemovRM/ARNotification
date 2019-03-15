//
//  ViewController.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit
import ARNotification

class ViewController: UIViewController {

	@IBOutlet weak var segmentedControl: UISegmentedControl!
	
	var notification = ARNotification.shared
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
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
		notification.push(type: .warning, title: "Внимание! Спасибо за внимание")
	}
	
	@objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
		var settings = ARNotificationSettings()
		settings.position = sender.selectedSegmentIndex == 0 ? ARNotificationPosition.top : ARNotificationPosition.bottom
		
		ARNotification.shared.settings = settings
	}
}

