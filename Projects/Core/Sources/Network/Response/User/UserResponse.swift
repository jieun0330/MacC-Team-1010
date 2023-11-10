//
//  SkipSigninResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct UserResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: UserResult?
	
	public init(status: Int = 0, resultMsg: String = "", result: UserResult? = nil) {
		self.status = status
		self.resultMsg = resultMsg
		self.result = result
	}
}

public struct UserResult: Codable {
	public let userID: Int?
	public let userNickName: String?
	public let userSex: String?
	public let userAgeRange: String?
	public let isUserVerified: String?
	public let userJoinDate: String?
}
