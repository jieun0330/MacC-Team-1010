//
//  MakgeolliResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct DetailResponse: Codable {
	public let resultCode: Int
	public let resultMsg: String
	public let result: DetailResult?
}

public struct DetailResult: Codable {
	public let makSeq: Int?
	public let makType: String?
	public let makName: String?
	public let makImageNumber: String?
	public let attributes: [DetailAttribute]?
	
	public var toEntity: MakHoly {
		return MakHoly.test1
	}
}

public struct DetailAttribute: Codable {
	public let mainDetail: [MainDetail]?
	public let taste: [DetailTasteInfo]?
	public let makContent: String?
	public let makAwards: [String]?
	public let makRaw: String?
	public let breweryInfo: [DetailBreweryInfo]?
}

public struct MainDetail: Codable {
	public let makAlcoholPercentage: Double?
	public let makVolume: Int?
	public let makPrice: Int?
}

public struct DetailTasteInfo: Codable {
	public let makTasteSweet: Double?
	public let makTasteSour: Double?
	public let makTasteThick: Double?
	public let makTasteFresh: Double?
}

public struct DetailBreweryInfo: Codable {
	public let makBrewery: String?
	public let makBreweryLink: String?
	public let makSalesLink: String?
}
