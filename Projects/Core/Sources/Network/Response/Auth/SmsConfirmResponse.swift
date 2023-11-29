//
//  SmsConfirmResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct SmsConfirmResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: Bool?
	
	public init(status: Int, resultMsg: String, result: Bool?) {
		self.status = status
		self.resultMsg = resultMsg
		self.result = result
	}
}
