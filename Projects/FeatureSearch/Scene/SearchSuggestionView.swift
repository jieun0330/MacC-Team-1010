//
//  SearchSuggestionView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct SearchSuggestionView: View {
    @Environment(\.isSearching) private var isSearching
    @ObservedObject var searchViewModel: SearchViewModel
    
    var body: some View {
        Group {
            if searchViewModel.searchText.isEmpty {
                SearchHistoryView(searchViewModel: self.searchViewModel)
            } else {
                SearchResultView()
            }
        }
        .background(Color(uiColor: .designSystem(.bgColor)!))
        .opacity(isSearching ? 1 : 0)
        .animation(.easeIn, value: isSearching)
        .padding(.horizontal, 16)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSuggestionView(searchViewModel: SearchViewModel())
    }
}

