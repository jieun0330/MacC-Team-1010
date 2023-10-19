//
//  CategoryView.swift
//  FeatureCategory
//
//  Created by Kim SungHun on 2023/10/19.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Common

public struct CategoryView: View {
	private let regionGroup = stride(from: 0,
									 to: RegionType.allCases.count,
									 by: 2).map { startIndex in
		Array(RegionType.allCases[
			startIndex..<min(startIndex + 2, RegionType.allCases.count)
		])
	}
	
	public init() { }
	
	public var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			ForEach(regionGroup, id: \.self) { regions in
				HStack {
					ForEach(regions, id: \.self) { region in
						RegionSingleView(
							title: region.rawValue
						)
					}
				}
			}
		}
		.padding(.horizontal, 16)
		.background(Color(uiColor: .designSystem(.bgColor)!))
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton())
	}
}

struct CategoryView_Previews: PreviewProvider {
	static var previews: some View {
		CategoryView()
	}
}
