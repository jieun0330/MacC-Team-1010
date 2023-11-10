//
//  GetUserMakFolderRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct GetUserMakFolderRequest: Codable {
	public let userId: Int
	
	public init(userId: Int) {
		self.userId = userId
	}
}
