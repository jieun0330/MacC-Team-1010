//
//  UserDefaultsWrapper.swift
//  Utils
//
//  Created by Kim SungHun on 2023/11/09.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultsWrapper<T: Codable> {
	private let key: String
	private let defaultValue: T
	
	init(key: String, defaultValue: T) {
		self.key = key
		self.defaultValue = defaultValue
	}
	
	var wrappedValue: T {
		get {
			if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
				let decoder = JSONDecoder()
				if let loadedObject = try? decoder.decode(T.self, from: savedData) {
					return loadedObject
				}
			}
			return defaultValue
		}
		set {
			let encoder = JSONEncoder()
			if let encoded = try? encoder.encode(newValue) {
				UserDefaults.standard.setValue(encoded, forKey: key)
			}
		}
	}
}
