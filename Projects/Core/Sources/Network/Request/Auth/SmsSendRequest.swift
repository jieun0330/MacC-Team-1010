//
//  SmsSendRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct SmsSendRequest: Codable {
	let phone: String
	
	public init(phone: String) {
		self.phone = phone
	}
}
