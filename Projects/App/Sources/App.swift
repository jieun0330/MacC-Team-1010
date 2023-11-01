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
	init() {
		FirebaseApp.configure()
	}
	
	var body: some Scene {
		WindowGroup {
			RootView()
		}
	}
}
