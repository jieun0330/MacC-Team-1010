//
//  MakgeolliFindByFeaturesResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

import Foundation

public struct MakgeolliFindByFeaturesResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: MakInfoResult?
}

public struct MakInfoResult: Codable {
	public let recordCounts: Int?
	public let makInfo: MakInfoContent?
	public let pageable: MakInfoPageable?
	public let totalPages: Int?
	public let totalElements: Int?
	public let last: Bool?
	public let size: Int?
	public let number: Int?
	public let sort: MakInfoSort?
	public let numberOfElements: Int?
	public let first: Bool?
	public let empty: Bool?
}

public struct MakInfoContent: Codable {
	public let content: [MakInfoDetail]?
}

public struct MakInfoDetail: Codable {
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

public struct MakInfoPageable: Codable {
	public let pageNumber: Int?
	public let pageSize: Int?
	public let sort: MakInfoSort?
	public let offset: Int?
	public let paged: Bool?
	public let unpaged: Bool?
}

public struct MakInfoSort: Codable {
	public let empty: Bool?
	public let sorted: Bool?
	public let unsorted: Bool?
}
