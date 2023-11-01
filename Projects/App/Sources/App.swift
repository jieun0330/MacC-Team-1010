//
//  App.swift
//  TenTen
//
//  Created by Kim SungHun on 2023/10/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Feature
import Firebase

@main
struct _App: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
	var body: some Scene {
		WindowGroup {
			RootView()
		}
	}
}

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions:
					 [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		return true
	}
}
