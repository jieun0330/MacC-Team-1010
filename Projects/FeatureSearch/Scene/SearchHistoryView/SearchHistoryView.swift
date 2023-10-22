//
//  SearchHistoryView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

struct SearchHistoryView: View {
    @ObservedObject var searchViewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            Color(.blue)
            Text("SearchHistoryView")
        }
    }
}

#Preview {
    SearchHistoryView(searchViewModel: SearchViewModel())
}
