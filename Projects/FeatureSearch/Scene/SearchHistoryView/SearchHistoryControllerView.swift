//
//  SearchHistoryControllerView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/22.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

struct SearchHistoryControllerView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            Text("최근 검색어")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: {
                searchViewModel.clearSearchHistory()
            }, label: {
                Text("모두 삭제")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(uiColor: .designSystem(.searchAccentColor)!))
            })
        }
        .frame(height: 40)
    }
}

#Preview {
    SearchHistoryControllerView(searchViewModel: SearchViewModel())
}
