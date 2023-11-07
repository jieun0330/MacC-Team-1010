//
//  EvaluateResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct EvaluateResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: EvaluateResult?
}

public struct EvaluateResult: Codable {
	public let isSuccess: Bool?
	public let message: String?
}
