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
                VStack {
                    searchHistoryListSingleView(searchHistory: searchHistory)
                    Divider()
                        .frame(height: 1)
                        .background(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
                }
            }
        }
    }
    
}

private extension SearchHistoryListView {
    @ViewBuilder
    func searchHistoryListSingleView(searchHistory: String) -> some View {
        HStack {
            Button(action: {
                searchViewModel.setCompletion(searchHistory)
            }, label: {
                HStack {
                    Text(searchHistory)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                    Spacer()
                }
            })
            
            Button(action: {
                searchViewModel.deleteSearchHistory(searchHistory)
            }, label: {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
            })
        }
        .padding(.horizontal, 4)
    }
}


struct SearchHistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryListView(searchViewModel: SearchViewModel())
    }
}
