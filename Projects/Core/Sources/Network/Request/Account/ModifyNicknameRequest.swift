//
//  ModifyNicknameRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct ModifyNicknameRequest: Codable {
	let userId: String
	let modifyNickname: String
	
	public init(userId: String, modifyNickname: String) {
		self.userId = userId
		self.modifyNickname = modifyNickname
	}
}
