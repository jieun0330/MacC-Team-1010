//
//  MakgeolliListRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakgeolliListRequest: Codable {
	let lastMakNum: Int?
	let categories: [String]?
	let sort: String?
}
