//
//  String+.swift
//  Core
//
//  Created by Eric Lee on 11/3/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

extension String {
	public static func formattedSet(adv: Double, volume: Int, price: Int) -> String {
		return adv.formattedAdv() + " ・ " + volume.formattedVolume() +  " ・ " + price.formattedPrice()
	}
}
