//
//  SkipSigninRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct UserRequest: Codable {
	public let userNickName: String
	public let userSex: String
	public let userAgeRange: String
	
	public init(userNickName: String, userSex: String, userAgeRange: String) {
		self.userNickName = userNickName
		self.userSex = userSex
		self.userAgeRange = userAgeRange
	}
}
