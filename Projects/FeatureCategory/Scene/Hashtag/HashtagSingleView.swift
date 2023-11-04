//
//  HashtagSingleView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct HashtagSingleView: View {
	let type: CharacteristicsType
	let proxy: ScrollViewProxy
	
	@ObservedObject var viewModel: CategoryViewModel
	@Binding var targetTitle: [CharacteristicsType]
	
	var body: some View {
		Button {
			if targetTitle.contains(type) {
				if let index = targetTitle.firstIndex(where: {$0 == type}) {
					targetTitle.remove(at: index)
				}
			} else {
				targetTitle.append(type)
			}
			withAnimation {
				proxy.scrollTo(type, anchor: .center)
			}
			viewModel.fetchCategoryMakgeolli(categories: targetTitle)
		} label: {
			Text(type.description)
				.font(.style(.SF15R))
				.foregroundColor(.white)
		}
		.cornerRadius(10)
		.buttonStyle(.borderedProminent)
		.tint(targetTitle.contains(type) ? Color(uiColor: .designSystem(.goldenyellow)!) :
				Color(uiColor: .designSystem(.w10)!))
		.id(type)
		.onAppear {
			withAnimation {
				proxy.scrollTo(targetTitle)
			}
		}
	}
}
