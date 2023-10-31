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
	let title: String
	let proxy: ScrollViewProxy
	
	@ObservedObject var viewModel: CategoryViewModel
	@Binding var targetTitle: [String]
	
	var body: some View {
		Button {
			// 선택한 태그에 맞춰 fetch
			viewModel.fetchCategoryList()
			if targetTitle.contains(title) {
				if let index = targetTitle.firstIndex(where: {$0 == title}) {
					targetTitle.remove(at: index)
				}
			} else {
				targetTitle.append(title)
			}
			withAnimation {
				proxy.scrollTo(title, anchor: .center)
			}
		} label: {
			Text(title)
				.font(.style(.SF15R))
				.foregroundColor(.white)
		}
		.cornerRadius(10)
		.buttonStyle(.borderedProminent)
		.tint(targetTitle.contains(title) ? Color(uiColor: .designSystem(.goldenyellow)!) :
				Color(uiColor: .designSystem(.w20)!))
		.id(title)
		.onAppear {
			withAnimation {
				proxy.scrollTo(targetTitle)
			}
		}
	}
}
