//
//  CheckNicknameResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct CheckNicknameResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: CheckNicknameResult?
	
	public init(status: Int = 0, resultMsg: String = "", result: CheckNicknameResult? = nil) {
		self.status = status
		self.resultMsg = resultMsg
		self.result = result
	}
}

public struct CheckNicknameResult: Codable {
	public let isSuccess: Bool?
	public let message: String?
}
