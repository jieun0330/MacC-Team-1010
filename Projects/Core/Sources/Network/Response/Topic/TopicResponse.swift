//
//  TopicResponse.swift
//  Core
//
//  Created by Kim SungHun on 12/2/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public struct TopicResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: TopicResult?
}

public struct TopicResult: Codable {
	public let content: [MakContent]?
	public let pageable: Pageable?
	public let first, last: Bool?
	public let size, number: Int?
	public let sort: TopicSort?
	public let numberOfElements: Int?
	public let empty: Bool?
}

public struct TopicPageable: Codable {
	public let pageNumber, pageSize: Int?
	public let sort: TopicSort?
	public let offset: Int?
	public let paged, unpaged: Bool?
}

public struct TopicSort: Codable {
	public let empty, unsorted, sorted: Bool?
}
