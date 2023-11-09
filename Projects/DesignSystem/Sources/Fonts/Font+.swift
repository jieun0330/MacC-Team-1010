//
//  Font+extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import SwiftUI

extension Font {
	
	public static func style(_ fontStyle: TENTENFont) -> Font {
		
		switch fontStyle {
			
		case .SFTitle:
			return .system(size: 34, weight: .bold)
		case .SF24B:
			return .system(size: 24, weight: .bold)
		case .SF20B:
			return .system(size: 20, weight: .bold)
		case .SF17R:
			return .system(size: 17, weight: .regular)
		case .SF14R:
			return .system(size: 14, weight: .regular)
		case .SF12B:
			return .system(size: 12, weight: .bold)
		case .SF12R:
			return .system(size: 12, weight: .regular)
		case .SF10B:
			return .system(size: 10, weight: .bold)
		case .SF10R:
			return .system(size: 10, weight: .regular)
		case .SF16R:
			return .system(size: 16, weight: .regular)
		case .SF15R:
			return .system(size: 15, weight: .regular)
		}
		
	}
}
