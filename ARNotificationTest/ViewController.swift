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

	@IBAction func buttonClicked() {
		notification.push(type: .error, title: "Невозможно получить данные с сервера Проверьте соединение с интернетом")
	}
	

}

