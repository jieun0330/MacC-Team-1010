//
//  MakgeolliFindByFeaturesRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakgeolliFindByFeaturesRequest: Codable {
	let sort: Int
	let offset: Int
	let category: [String]?
	let pageable: MakgeolliFindByFeaturesPageable
	
	public init(sort: Int, offset: Int = 0,
				category: [String]?, pageable: MakgeolliFindByFeaturesPageable) {
		self.sort = sort
		self.offset = offset
		self.category = category
		self.pageable = pageable
	}
}

public struct MakgeolliFindByFeaturesPageable: Codable {
	let page: Int
	let size: Int
	let sort: [String]
	
	public init(page: Int, size: Int, sort: [String]) {
		self.page = page
		self.size = size
		self.sort = sort
	}
}
