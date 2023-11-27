//
//  ModifyNicknameResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct ModifyNicknameResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: ModifyNicknameResult?
	
	public init(status: Int = 0, resultMsg: String = "", result: ModifyNicknameResult? = nil) {
		self.status = status
		self.resultMsg = resultMsg
		self.result = result
	}
}

public struct ModifyNicknameResult: Codable {
	public let isSuccess: Bool?
	public let message: String?
	public let userId: Int?
	public let modifiedNick: String?
}
