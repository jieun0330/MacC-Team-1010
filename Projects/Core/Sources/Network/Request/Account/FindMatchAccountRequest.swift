//
//  FindMatchAccountRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/28.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct FindMatchAccountRequest: Codable {
	let phone: String
	let birth: String
	
	public init(phone: String, birth: String) {
		self.phone = phone
		self.birth = birth
	}
}
