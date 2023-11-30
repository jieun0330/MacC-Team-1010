//
//  SearchView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

public struct SearchView: View {
	@StateObject private var searchViewModel = SearchViewModel(
		searchRepository: DefaultSearchRepository()
	)
	
	public init() { }
	
	public var body: some View {
		NavigationStack {
			ZStack {
				Color.DarkBase.ignoresSafeArea()
				SearchSuggestionView(searchViewModel: searchViewModel)
			}
			.alert(item: $searchViewModel.alertItem) { alertItem in
				if alertItem.dismissButton == nil {
					return Alert(title: alertItem.title,
								 message: alertItem.message,
								 primaryButton: alertItem.primaryButton!,
								 secondaryButton: alertItem.secondaryButton!)
				} else {
					return Alert(title: alertItem.title,
								 message: alertItem.message,
								 dismissButton: alertItem.dismissButton)
				}
			}
			.navigationTitle("검색")
			.navigationBarTitleDisplayMode(.inline)
			.searchable(
				text: $searchViewModel.searchText,
				prompt: "막걸리 이름 ..."
			)
			.onChange(of: searchViewModel.searchText) { newValue in
				searchViewModel.searchState = true
				searchViewModel.fetchLoading = true
			}
			.onSubmit(of: .search) {
				searchViewModel.searchState = false
				searchViewModel.searchMakHolies(searchText: searchViewModel.searchText, method: .submit)
			}
			.onAppear {
				UIBarButtonItem.appearance(
					whenContainedInInstancesOf: [UISearchBar.self]).title = "취소"
				UISearchBar.appearance().tintColor = .designSystem(.primary)
			}
			.toolbarBackground(
				Color.W10,
				for: .navigationBar
			)
		}
	}
}
