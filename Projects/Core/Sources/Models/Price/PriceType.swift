//
//  PriceType.swift
//  Core
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum PriceType: CaseIterable, Hashable {
	case one
	case two
	case three
	case four
	case five
	case six
		
	public var description: String {
		switch self {
		case .one:
			return "~5천 원"
		case .two:
			return "5천 원~ 만 원"
		case .three:
			return "만 원~2만 원"
		case .four:
			return "2만 원~5만 원"
		case .five:
			return "5만 원~10만 원"
		case .six:
			return "10만 원 이상"
		}
	}
}
