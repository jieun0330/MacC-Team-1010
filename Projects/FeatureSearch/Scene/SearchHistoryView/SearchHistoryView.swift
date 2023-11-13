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
		if UserDefaults.standard.array(forKey: "searchHistorys") == nil ||
			UserDefaults.standard.array(forKey: "searchHistorys")!.isEmpty {
			VStack(spacing: 20) {
				Text("막걸리 이름으로 검색해보세요!")
					.SF17R()
					.foregroundColor(.W50)
				Image(uiImage: .designSystem(.character)!)
			}
		} else {
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
}
