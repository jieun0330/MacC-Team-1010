//
//  SearchView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import FeatureMain

public struct SearchView: View {
	@StateObject private var searchViewModel: SearchViewModel = SearchViewModel()
	
	public init() { }
	
	public var body: some View {
		ZStack {
			MainView()
			SearchSuggestionView(searchViewModel: searchViewModel)
		}
		.searchable(text: $searchViewModel.searchText)
		.onSubmit(of: .search) {
			searchViewModel.addSearchHistory()
		}
		.onAppear {
			UISearchBar.appearance().tintColor = .designSystem(.searchAccentColor)
		}
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			SearchView()
		}
	}
}
