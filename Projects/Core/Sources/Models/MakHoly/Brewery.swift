//
//  Brewery.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Brewery: Hashable {
	/// 양조장 이름
	public let name: String
	/// 양조장 사이트
	public let url: String?
	/// 판매 사이트
	public let salesURL: String?
	
	public init(name: String, url: String?, salesURL: String?) {
		self.name = name
		self.url = url
		self.salesURL = salesURL
	}
	
	public init() {
		self.init(name: "", url: nil, salesURL: nil)
	}
}
