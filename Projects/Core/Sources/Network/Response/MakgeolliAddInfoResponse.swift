//
//  MakgeolliResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakgeolliAddInfoResponse {
	public let review: [String]
	public let like: [String]
	public let bad: [String]
	public let bookmark: [String]
	public let docID: String
}
