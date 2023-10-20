//
//  SearchView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import FeatureMain

struct SearchView: View {
    @StateObject private var searchViewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            MainView()
            SearchSuggestionView()
                .environmentObject(searchViewModel)
        }
        .searchable(text: $searchViewModel.searchText)
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
