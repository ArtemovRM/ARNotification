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
		
		insideView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
	}
	
	override func layoutSubviews() {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
		layer.shadowOffset = CGSize.zero
		layer.shadowOpacity = 0.2
		layer.shadowRadius = 4
		layer.shouldRasterize = true
		layer.rasterizationScale = UIScreen.main.scale
	}
}

