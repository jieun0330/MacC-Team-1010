//
//  AuthUserRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct AuthUserRequest: Codable {
	let userNickName: String
	let userPhone: String
	let userSex: String
	let userBirth: String
	
	public init(userNickName: String, userPhone: String, userSex: String, userBirth: String) {
		self.userNickName = userNickName
		self.userPhone = userPhone
		self.userSex = userSex
		self.userBirth = userBirth
	}
}
