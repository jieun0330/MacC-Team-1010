//
//  WishListRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct WishListRequest: Codable {
	public let userId: Int
	public let makNumber: Int
	
	init(userId: Int, makNumber: Int) {
		self.userId = userId
		self.makNumber = makNumber
	}
}
