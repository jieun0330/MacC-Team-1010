//
//  WishListRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct WishListResponse: Codable {
	public let status: Int
	public let resultMsg: String?
	public let result: WishListResult?
}

public struct WishListResult: Codable {
	public let isSuccess: Bool?
	public let message: String?
}
