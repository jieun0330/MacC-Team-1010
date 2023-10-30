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
	@Binding var targetTitle: String
	
	var body: some View {
		Button {
			viewModel.fetchCategoryList()
			targetTitle = title
			
			withAnimation {
				proxy.scrollTo(title, anchor: .center)
			}
		} label: {
			Text(title)
				.font(.system(size: 15))
				.foregroundColor(.white)
		}
		.cornerRadius(40)
		.buttonStyle(.borderedProminent)
		.tint(title == targetTitle ? Color(uiColor: .designSystem(.primary)!) :
				Color(uiColor: .designSystem(.lightgrey)!))
		.id(title)
		.onAppear {
			withAnimation {
				proxy.scrollTo(targetTitle)
			}
		}
	}
}
