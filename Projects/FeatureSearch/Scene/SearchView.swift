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
			SearchSuggestionView(searchViewModel: searchViewModel)
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
					searchViewModel.searchMakHolies(searchText: searchViewModel.searchText)
				}
				.onAppear {
					UIBarButtonItem.appearance(
						whenContainedInInstancesOf: [UISearchBar.self]).title = "취소"
					UISearchBar.appearance().tintColor = .designSystem(.primary)
				}
				.background(Color(uiColor: .designSystem(.darkbase)!))
				.alert(isPresented: $searchViewModel.errorState) {
					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
						  dismissButton: .default(Text("확인")))
				}
				.toolbarBackground(
					Color.DarkBase,
					for: .navigationBar
				)
		}
	}
}
