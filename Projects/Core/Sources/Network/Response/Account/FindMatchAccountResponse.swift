//
//  FindMatchAccountResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/28.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct FindMatchAccountResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: FindMatchAccountResult?
	
	public init(status: Int = 0, resultMsg: String = "", result: FindMatchAccountResult? = nil) {
		self.status = status
		self.resultMsg = resultMsg
		self.result = result
	}
}

public struct FindMatchAccountResult: Codable {
	public let isAccountExisted: Bool?
	public let userResults: FindMatchAccountUserResult?
}

public struct FindMatchAccountUserResult: Codable {
	public let userID: Int?
	public let userNickName: String?
	public let userPhone: String?
	public let userBirth: String?
	public let userSex: String?
	public let userAgeRange: String?
	public let isUserVerified: String?
	public let userJoinDate: String?
	
	public init(userID: Int = 0,
				userNickName: String = "",
				userPhone: String = "",
				userBirth: String = "",
				userSex: String = "",
				userAgeRange: String = "",
				isUserVerified: String = "",
				userJoinDate: String = ""
	) {
		self.userID = userID
		self.userNickName = userNickName
		self.userPhone = userPhone
		self.userBirth = userBirth
		self.userSex = userSex
		self.userAgeRange = userAgeRange
		self.isUserVerified = isUserVerified
		self.userJoinDate = userJoinDate
	}
}
