//
//  DeleteUserRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct DeleteUserRequest: Codable {
	let userId: String

	public init(userId: String) {
		self.userId = userId
	}
}
