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
	public let result: UserData?
}

public struct UserData: Codable {
	public let userID: Int?
	public let userNickName: String?
	public let userSex: String?
	public let userAgeRange: String?
	public let isUserVerified: String?
	public let userJoinDate: String?
}
