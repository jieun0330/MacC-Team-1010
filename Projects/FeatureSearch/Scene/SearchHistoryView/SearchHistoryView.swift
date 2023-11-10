//
//  SearchHistoryView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct SearchHistoryView: View {
	@ObservedObject var searchViewModel: SearchViewModel
	
	var body: some View {
		VStack(spacing: 0) {
			SearchHistoryControllerView(searchViewModel: searchViewModel)
			DividerView()
			SearchHistoryListView(searchViewModel: searchViewModel)
		}
		.onAppear {
			searchViewModel.fetchSearchHistorys()
		}
	}
}
