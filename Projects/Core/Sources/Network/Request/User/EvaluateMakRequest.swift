//
//  EvaluateRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct EvaluateMakRequest: Codable {
	let userId: Int
	let makNumber: Int
	let likeMak: String
	
	public init(userId: Int, makNumber: Int, likeMak: String) {
		self.userId = userId
		self.makNumber = makNumber
		self.likeMak = likeMak
	}
}
