//
//  DataLinkingResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct DataLinkingResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: DataLinkingResult?
	
	public init(status: Int = 0, resultMsg: String = "", result: DataLinkingResult? = nil) {
		self.status = status
		self.resultMsg = resultMsg
		self.result = result
	}
}

public struct DataLinkingResult: Codable {
	public let linkedResults: LinkedResults?
	public let isAlreadyLinked: Bool?
	public let userId: Int?
	public let userNickname: String?
	public let phoneSuffix: String?
	public let isUserVerified: String?
}

public struct LinkedResults: Codable {
	public let isSuccess: Bool?
	public let message: String?
}
