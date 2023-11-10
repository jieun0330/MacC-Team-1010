//
//  App.swift
//  TenTen
//
//  Created by Kim SungHun on 2023/10/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Feature
import DesignSystem

@main
struct _App: App {
	var body: some Scene {
		WindowGroup {
			RootView()
				.onAppear {
					UITabBar.appearance().backgroundColor = .designSystem(.darkwindow)!
					UIView.appearance(whenContainedInInstancesOf:
										[UIAlertController.self]).tintColor = .designSystem(.primary)!
				}
				.accentColor(Color(uiColor: .designSystem(.primary)!))
		}
	}
}
