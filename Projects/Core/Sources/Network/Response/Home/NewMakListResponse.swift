//
//  NewMakListResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct NewMakListResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: [NewMakListMakgeolliDetail]?
}

public struct NewMakListMakgeolliDetail: Codable {
	public let makNumber: Int?
	public let makName: String?
	public let makType: String?
	public let makImageNumber: String?
	public let mainDetail: NewMakListMainDetail?
	public let taste: NewMakListTaste?
}

public struct NewMakListMainDetail: Codable {
	public let makAlcoholPercentage: Double?
	public let makVolume: Int?
	public let makPrice: Int?
}

public struct NewMakListTaste: Codable {
	public let makTasteSweet: Double?
	public let makTasteSour: Double?
	public let makTasteThick: Double?
	public let makTasteFresh: Double?
}
