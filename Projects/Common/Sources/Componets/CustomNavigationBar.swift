//
//  CustomNavigationBar.swift
//  Common
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import UIKit

public func setCustomNavigationBar() {
	let coloredAppearance = UINavigationBarAppearance()
	coloredAppearance.configureWithTransparentBackground()
	coloredAppearance.backgroundColor = UIColor(
		red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0
	)
	coloredAppearance.shadowColor = .clear
	coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
	coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

	UINavigationBar.appearance().standardAppearance = coloredAppearance
	UINavigationBar.appearance().compactAppearance = coloredAppearance
	UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
	UINavigationBar.appearance().tintColor = .white
}
