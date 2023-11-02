//
//  Encodable+.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public extension Encodable {
	func asDictionary() throws -> [String: Any] {
		let encoder = JSONEncoder()
		let data = try encoder.encode(self)
		guard let dictionary = try JSONSerialization.jsonObject(
			with: data,
			options: .allowFragments
		) as? [String: Any] else {
			throw NSError()
		}
		return dictionary
	}
}
