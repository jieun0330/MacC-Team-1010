//
//  SearchHistoryView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct SearchHistoryView: View {
	@ObservedObject var searchViewModel: SearchViewModel
	
	var body: some View {
		VStack {
			SearchHistoryControllerView(searchViewModel: searchViewModel)
			SearchHistoryListView(searchViewModel: searchViewModel)
		}
		.onAppear {
			searchViewModel.fetchSearchHistorys()
		}
	}
}

struct SearchHistoryView_Previews: PreviewProvider {
	static var previews: some View {
		SearchHistoryView(searchViewModel: SearchViewModel())
	}
}
