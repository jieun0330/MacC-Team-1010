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
		return MakHoly(id: String(makSeq ?? 0),
					   name: makName ?? "",
					   imageURL: makImageNumber ?? "",
					   adv: attributes?.first?.mainDetail?.first?.makAlcoholPercentage ?? 0.0,
					   volume: attributes?.first?.mainDetail?.first?.makVolume ?? 0,
					   price: attributes?.first?.mainDetail?.first?.makPrice ?? 0,
					   taste: Taste(sweetness: .one, sourness: .five, thickness: .four, freshness: .one), // 못함
					   description: attributes?.description ?? "",
					   awards: [Award(year: 0, name: "", type: "")], // 못함
					   ingredients: (attributes?.first?.makRaw?.components(separatedBy: ", ")) ?? [],
					   salesURL: attributes?.first?.breweryInfo?.first?.makSalesLink,
					   brewery: Brewery(name: attributes?.first?.breweryInfo?.first?.makBrewery ?? "",
										url: attributes?.first?.breweryInfo?.first?.makBreweryLink ?? ""),
					   myLikeState: LikeState.dislike,
					   isBookMarked: false,
					   myComment: Comment.init(description: "", isOpened: false, date: ""),
					   reviews: [Review(name: "", likeState: LikeState.dislike,
										comment: Comment(description: "", isOpened: false, date: ""))])
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
