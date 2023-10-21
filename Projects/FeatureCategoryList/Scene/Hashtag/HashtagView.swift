//
//  HashtagView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Common

struct HashtagView: View {
	@ObservedObject var viewModel: CategoryListViewModel
	
	var type: CategoryType
	
	@Binding var targetTitle: String
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 10) {
				switch type {
				case .characteristics:
					createCharacteristicsHashtag()
				case .price:
					createPriceHashtag()
				case .region:
					createRegionHashtag()
				}
			}
		}
	}
}

private extension HashtagView {
	@ViewBuilder
	func createCharacteristicsHashtag() -> some View {
		ForEach(CharacteristicsType.allCases, id: \.self) { characteristics in
			HashtagSingleView(viewModel: viewModel,
							  title: characteristics.description,
							  targetTitle: $targetTitle)
		}
	}
	
	@ViewBuilder
	func createPriceHashtag() -> some View {
		ForEach(PriceType.allCases, id: \.self) { price in
			HashtagSingleView(viewModel: viewModel,
							  title: price.description,
							  targetTitle: $targetTitle)
		}
	}
	
	@ViewBuilder
	func createRegionHashtag() -> some View {
		ForEach(RegionType.allCases, id: \.self) { region in
			HashtagSingleView(viewModel: viewModel,
							  title: region.rawValue,
							  targetTitle: $targetTitle)
		}
	}
}
