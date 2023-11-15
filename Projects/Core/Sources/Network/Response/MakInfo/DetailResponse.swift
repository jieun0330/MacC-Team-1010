//
//  MakgeolliResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct DetailResponse: Codable {
	public let status: Int
	public let resultMsg: String?
	public let result: DetailResult?
}

public struct DetailResult: Codable {
	public let makSeq: Int?
	public let makType: String?
	public let makName: String?
	public let makImageNumber: String?
	public let attributes: [DetailAttribute]?
	public let userAction: UserAction?
	
	public func toEntity() -> (MakHoly, MyReaction) {
		
		let id = makSeq ?? -1
		let name = makName ?? ""
		let imageId = makImageNumber ?? ""
		
		let attributes = attributes?[0].toEnities()
		let basicInfo = attributes?.0 ?? BasicInfo()
		let taste = attributes?.1 ?? Taste()
		let description = attributes?.2 ?? ""
		let awards = attributes?.3 ?? []
		let ingredients = attributes?.4 ?? ""
		let brewery = attributes?.5 ?? Brewery()
		
		let myReaction = userAction?.toEnity ?? MyReaction()
		
		return (MakHoly(
			id: id,
			name: name,
			imageId: imageId,
			taste: taste,
			basicInfo: basicInfo,
			ingredients: ingredients,
			description: description,
			brewery: brewery,
			awards: awards),
				myReaction)
	}
	
}

public struct UserAction: Codable {
	public let isAddedInUserWishList: String
	public let isUserEvaluate: String
	public let userEvaluateValue: String?
	public let isInMyComment: String
	public let commentContents: String?
	public let isCommentVisible: String?
	public let writeDate: String?
	
	public var toEnity: MyReaction {
		
		var isBookMarked = false
		var comment: MyComment? = nil
		var likeState: LikeState = .none
		
		if isInMyComment == "Y",
		   let commentContents = commentContents,
		   let date = writeDate{
			comment = MyComment(
				isVisible: isCommentVisible == "Y" ? true : false ,
				contents: commentContents,
				date: date)
		}
		
		if isAddedInUserWishList == "Y" {
			isBookMarked = true
		}
		
		if isUserEvaluate == "Y" {
			if userEvaluateValue == "LIKE" {
				likeState = .like
			} else {
				likeState = .dislike
			}
		}
		
		return MyReaction(isBookMarked: isBookMarked, likeState: likeState, comment: comment)
	}
}

public struct DetailAttribute: Codable {
	public let mainDetail: [MainDetail]?
	public let taste: [DetailTasteInfo]?
	public let makContent: String?
	public let makAwards: [String]?
	public let makRaw: String?
	public let breweryInfo: [DetailBreweryInfo]?
	
	public func toEnities() -> (BasicInfo, Taste, String, [Award], String, Brewery) {
		let basicInfo = mainDetail?[0].toEntity ?? BasicInfo()
		let taste = taste?[0].toEntity ?? Taste()
		let description = makContent ?? ""
		
		var awards: [Award] = []
		if let makAwards = makAwards {
			awards = makAwards.compactMap { Award($0) }
		}
		
		let ingredients = makRaw ?? ""
		let brewery = breweryInfo?[0].toEntity ?? Brewery()
		return (basicInfo, taste, description, awards, ingredients, brewery)
	}
}

public struct MainDetail: Codable {
	public let makAlcoholPercentage: Double?
	public let makVolume: Int?
	public let makPrice: Int?
	
	public var toEntity: BasicInfo {
		let adv = makAlcoholPercentage ?? -1.0
		let volume = makVolume ?? -1
		let price = makPrice ?? -1
		return BasicInfo(adv: adv, volume: volume, price: price)
	}
}

public struct DetailTasteInfo: Codable {
	public let makTasteSweet: Double?
	public let makTasteSour: Double?
	public let makTasteThick: Double?
	public let makTasteFresh: Double?
	
	public var toEntity: Taste {
		let sweetness = Int(makTasteSweet ?? -1.0)
		let sourness = Int(makTasteSour ?? -1.0)
		let thickness = Int(makTasteThick ?? -1.0)
		let freshness = Int(makTasteFresh ?? -1.0)
		return Taste(sweetness: sweetness, sourness: sourness, thickness: thickness, freshness: freshness)
	}
}

public struct DetailBreweryInfo: Codable {
	public let makBrewery: String?
	public let makBreweryLink: String?
	public let makSalesLink: String?
	
	public var toEntity: Brewery {
		return Brewery(name: makBrewery ?? "", url: makBreweryLink, salesURL: makSalesLink)
	}
}
