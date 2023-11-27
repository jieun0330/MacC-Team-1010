//
//  AuthUserResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct AuthUserResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: AuthUserResult?
	
	public init(status: Int = 0, resultMsg: String = "", result: AuthUserResult? = nil) {
		self.status = status
		self.resultMsg = resultMsg
		self.result = result
	}
}

public struct AuthUserResult: Codable {
	public let userID: Int?
	public let userNickName: String?
	public let userPhone: String?
	public let userBirth: String?
	public let userSex: String?
	public let userAgeRange: String?
	public let isUserVerified: String?
	public let userJoinDate: String?
}
