//
//  Brewery.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Brewery {
	public let name: String /// 양조장 이름
	public let url: String? /// 양조장 사이트
	public let salesURL: String? /// 판매 사이트
	
	public init(name: String, url: String?, salesURL: String?) {
		self.name = name
		self.url = url
		self.salesURL = salesURL
	}
}
