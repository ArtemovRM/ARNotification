//
//  ARNotificationWrapperView.swift
//  ARNotificationTest
//
//  Created by Роман Артемов on 25/02/2019.
//  Copyright © 2019 Роман Артемов. All rights reserved.
//

import UIKit

class ARNotificationShadowWrapperView<T: UIView>: UIView {
	
	var radius: CGFloat = 4
	
	var insideView: T!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		initView()
	}
	
	private func initView() {
		insideView = T(frame: bounds)
		addSubview(insideView)
		
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

