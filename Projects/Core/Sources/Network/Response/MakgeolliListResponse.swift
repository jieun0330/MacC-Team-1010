//
//  MakgeolliListResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakgeolliListResponse: Codable {
	public let resultCode: Int?
	public let resultMsg: String?
	public let result: MakgeolliListResult?
}

public struct MakgeolliListResult: Codable {
	public let contents: [MakgeolliItem]?
	public let totalCount: Int?
	public let nextCursor: Int?
	public let pageInfo: [PageInfo]?
}

public struct MakgeolliItem: Hashable, Codable {
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

public struct PageInfo: Codable {
	public let currentPage: Int?
	public let size: Int?
	public let first: Bool?
	public let last: Bool?
	public let totalMakElements: Int?
	public let totalPages: Int?
}
