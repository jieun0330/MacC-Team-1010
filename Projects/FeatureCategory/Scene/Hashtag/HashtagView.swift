//
//  HashtagView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct HashtagView: View {
	let type: CategoryType
	
	@ObservedObject var viewModel: CategoryViewModel
	@Binding var targetTitle: [String]
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			ScrollViewReader { scrollViewProxy in
				HStack(spacing: 10) {
					switch type {
					case .characteristics:
						createCharacteristicsHashtag(proxy: scrollViewProxy)
					case .price:
						createPriceHashtag(proxy: scrollViewProxy)
					case .region:
						createRegionHashtag(proxy: scrollViewProxy)
					}
				}
			}
		}
	}
}

private extension HashtagView {
	@ViewBuilder
	func createCharacteristicsHashtag(proxy: ScrollViewProxy) -> some View {
		ForEach(CharacteristicsType.allCases, id: \.self) { characteristics in
			HashtagSingleView(title: characteristics.description,
							  proxy: proxy,
							  viewModel: viewModel,
							  targetTitle: $targetTitle)
		}
	}
	
	@ViewBuilder
	func createPriceHashtag(proxy: ScrollViewProxy) -> some View {
		ForEach(PriceType.allCases, id: \.self) { price in
			HashtagSingleView(title: price.description,
							  proxy: proxy,
							  viewModel: viewModel,
							  targetTitle: $targetTitle)
		}
	}
	
	@ViewBuilder
	func createRegionHashtag(proxy: ScrollViewProxy) -> some View {
		ForEach(RegionType.allCases, id: \.self) { region in
			HashtagSingleView(title: region.rawValue,
							  proxy: proxy,
							  viewModel: viewModel,
							  targetTitle: $targetTitle)
		}
	}
}
