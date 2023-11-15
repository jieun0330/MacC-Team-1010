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
	public let segmentName: String
	public let offset: Int

	public init(userId: Int, segmentName: String, offset: Int) {
		self.userId = userId
		self.segmentName = segmentName
		self.offset = offset
	}
}
