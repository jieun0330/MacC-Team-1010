//
//  WishListRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct WishListRequest: Codable {
	let userId: Int
	let makNumber: Int
	
	public init(userId: Int, makNumber: Int) {
		self.userId = userId
		self.makNumber = makNumber
	}
}
