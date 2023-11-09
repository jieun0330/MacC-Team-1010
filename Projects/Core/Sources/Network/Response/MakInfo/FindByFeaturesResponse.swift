//
//  MakgeolliFindByFeaturesResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct FindByFeaturesResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: FindByFeaturesResult?
}

public struct FindByFeaturesResult: Codable {
	public let recordCounts: Int?
	public let makInfo: FindByFeaturesContent?
}

public struct FindByFeaturesContent: Codable {
	public let content: [MakContent]?
	public let pageable: FindByFeaturesResponsePageable?
	public let totalPages: Int?
	public let totalElements: Int?
	public let last: Bool?
	public let size: Int?
	public let number: Int?
	public let sort: FindByFeaturesSort?
	public let numberOfElements: Int?
	public let first: Bool?
	public let empty: Bool?
}

public struct MakContent: Hashable, Codable {
	public let makSeq: Int?
	public let makName: String?
	public let makType: String?
	public let makAlcoholPercentage: Double?
	public let makVolume: Int?
	public let makPrice: Int?
	public let makTasteSweet: Double?
	public let makTasteSour: Double?
	public let makTasteThick: Double?
	public let makTasteFresh: Double?
	public let makImageNumber: String?
}

public struct FindByFeaturesResponsePageable: Codable {
	public let pageNumber: Int?
	public let pageSize: Int?
	public let sort: FindByFeaturesSort?
	public let offset: Int?
	public let paged: Bool?
	public let unpaged: Bool?
}

public struct FindByFeaturesSort: Codable {
	public let empty: Bool?
	public let sorted: Bool?
	public let unsorted: Bool?
}
