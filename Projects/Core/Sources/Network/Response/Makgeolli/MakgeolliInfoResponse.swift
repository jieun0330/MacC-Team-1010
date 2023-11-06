//
//  MakgeolliResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakgeolliInfoResponse: Codable {
	public let resultCode: Int?
	public let resultMsg: String?
	public let result: MakgeolliDetail?
}

public struct MakgeolliDetail: Codable {
	public let makSeq: Int?
	public let makType: String?
	public let makName: String?
	public let makImageNumber: String?
	public let attributes: [MakgeolliAttribute]?
	
	public var toEntity: MakHoly {
		return MakHoly.test1
	}
}

public struct MakgeolliAttribute: Codable {
	public let mainDetail: [MainDetail]?
	public let taste: [TasteInfo]?
	public let makContent: String?
	public let makAwards: [String]?
	public let makRaw: String?
	public let breweryInfo: [BreweryInfo]?
}

public struct MainDetail: Codable {
	public let makAlcoholPercentage: Double?
	public let makVolume: Int?
	public let makPrice: Int?
}

public struct TasteInfo: Codable {
	public let makTasteSweet: Double?
	public let makTasteSour: Double?
	public let makTasteThick: Double?
	public let makTasteFresh: Double?
}

public struct BreweryInfo: Codable {
	public let makBrewery: String?
	public let makBreweryLink: String?
	public let makSalesLink: String?
}
