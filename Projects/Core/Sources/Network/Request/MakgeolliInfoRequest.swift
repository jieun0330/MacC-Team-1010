//
//  MakgeolliRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakgeolliInfoRequest: Codable {
	public init(makNumber: Int) {
		self.makNumber = makNumber
	}
	
	let makNumber: Int
}
