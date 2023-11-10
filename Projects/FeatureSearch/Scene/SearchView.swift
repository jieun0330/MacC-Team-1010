//
//  SearchView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct SearchView: View {
	@StateObject private var searchViewModel: SearchViewModel = SearchViewModel()
	
	public init() { }
	
	public var body: some View {
		NavigationStack {
			SearchSuggestionView(searchViewModel: searchViewModel)
				.searchable(text: $searchViewModel.searchText)
				.onSubmit(of: .search) {
					searchViewModel.addSearchHistory()
				}
				.onAppear {
					UISearchBar.appearance().tintColor = .designSystem(.primary)
				}
		}
	}
}
