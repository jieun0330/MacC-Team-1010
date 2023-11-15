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
	@ObservedObject var viewModel: CategoryViewModel
	
	@Binding var targetTitle: [CharacteristicsType]
	 
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			ScrollViewReader { scrollViewProxy in
				HStack(spacing: 10) {
					createCharacteristicsHashtag(proxy: scrollViewProxy)
				}
			}
		}
	}
}

private extension HashtagView {
	@ViewBuilder
	func createCharacteristicsHashtag(proxy: ScrollViewProxy) -> some View {
		Spacer()
			.frame(width: 16, height: 1)
			.padding(.trailing, -10)
		ForEach(CharacteristicsType.allCases, id: \.self) { characteristics in
			if characteristics != .none {
				HashtagSingleView(type: characteristics,
								  proxy: proxy,
								  viewModel: viewModel,
								  targetTitle: $targetTitle)
			}
		}
	}
}
