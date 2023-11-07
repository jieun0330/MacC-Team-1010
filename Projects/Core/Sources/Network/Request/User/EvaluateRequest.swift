//
//  EvaluateRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct EvaluateRequest: Codable {
	public let userId: Int
	public let makNumber: Int
	public let likeMak: String
	
	init(userId: Int, makNumber: Int, likeMak: String) {
		self.userId = userId
		self.makNumber = makNumber
		self.likeMak = likeMak
	}
}
