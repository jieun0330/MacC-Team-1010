//
//  ReviewResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct ReviewResponse: Hashable {
	public let updateDate: String
	public let disclosure: Bool
	public let userID: String
	public let content: String
	public let makgeolliID: String
	public let docID: String
	public let preference: Int
	public let makName: String
}
