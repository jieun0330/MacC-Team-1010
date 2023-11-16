//
//  SearchHistoryListView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/22.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct SearchHistoryListView: View {
	@ObservedObject var searchViewModel: SearchViewModel
	
	var body: some View {
		ScrollView(showsIndicators: false) {
			VStack(spacing: 0) {
				ForEach(searchViewModel.searchHistorys.reversed(), id: \.self) { searchHistory in
					searchHistoryListSingleView(searchHistory: searchHistory)
					DividerView()
				}
			}
		}
	}
}

private extension SearchHistoryListView {
	@ViewBuilder
	func searchHistoryListSingleView(searchHistory: String) -> some View {
		HStack(alignment: .center, spacing: 0) {
			Button(action: {
				searchViewModel.setCompletion(searchHistory)
			}, label: {
				HStack {
					Text(searchHistory)
						.font(.style(.SF16R))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					Spacer()
				}
			})
			Button(action: {
				searchViewModel.deleteSearchHistory(searchHistory)
			}, label: {
				Image(systemName: "xmark")
					.font(.style(.SF16R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
			})
		}
		.padding(.vertical, 15)
	}
}
