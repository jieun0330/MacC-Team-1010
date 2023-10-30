//
//  SearchHistoryListView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/22.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

struct SearchHistoryListView: View {
	@ObservedObject var searchViewModel: SearchViewModel
	
	var body: some View {
		ScrollView(showsIndicators: false) {
			ForEach(searchViewModel.searchHistorys.reversed(), id: \.self) { searchHistory in
				VStack(spacing: 0) {
					searchHistoryListSingleView(searchHistory: searchHistory)
					Divider()
						.foregroundColor(Color(uiColor: .designSystem(.w25)!))
						.frame(height: 0.33)
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

struct SearchHistoryListView_Previews: PreviewProvider {
	static var previews: some View {
		SearchHistoryListView(searchViewModel: SearchViewModel())
	}
}
