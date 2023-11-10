//
//  BasicInfo.swift
//  Core
//
//  Created by Eric Lee on 11/9/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct BasicInfo {
	/// 도수
	public let adv: Double
	/// 용량
	public let volume: Int
	/// 가격
	public let price: Int
	
	public init(
		adv: Double,
		volume: Int,
		price: Int) {
		self.adv = adv
		self.volume = volume
		self.price = price
	}
	
	public init() {
		self.init(adv: -1.0, volume: -1, price: -1)
	}
	
	public var description: String {
		return "\(adv.formattedAdv())도 ・ \(String(volume))ml ・ \(String(price))원"
	}
	
	// 임시 : MakHolyMini 사용하는 부분에서 오류 해결용
	// MakHolyMini에서도 Basic Info 리팩토링 하기
	public static func formattedSet(adv: Double, volume: Int, price: Int) -> String {
		return "\(adv.formattedAdv())도 ・ \(String(volume))ml ・ \(String(price))원"
	}
}
