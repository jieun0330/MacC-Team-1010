//
//  GetUserMakFolderRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct GetUserMakFolderRequest: Codable {
	let userId: Int
	let segmentName: String
	let lastmakNum: Int
	let pageable: GetUserMakFolderPageable
	
	public init(userId: Int, segmentName: String = "entire", lastmakNum: Int = 300000,
				pageable: GetUserMakFolderPageable) {
		self.userId = userId
		self.segmentName = segmentName
		self.lastmakNum = lastmakNum
		self.pageable = pageable
	}
}

public struct GetUserMakFolderPageable: Codable {
	let page: Int
	let size: Int
	let sort: [String]
	
	public init(page: Int, size: Int, sort: [String]) {
		self.page = page
		self.size = size
		self.sort = sort
	}
}
