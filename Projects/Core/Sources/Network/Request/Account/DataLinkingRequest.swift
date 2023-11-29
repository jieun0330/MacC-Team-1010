//
//  DataLinkingRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct DataLinkingRequest: Codable {
	let userId: String
	let phone: String
	let birth: String
	
	public init(userId: String, phone: String, birth: String) {
		self.userId = userId
		self.phone = phone
		self.birth = birth
	}
}
