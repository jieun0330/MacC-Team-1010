//
//  SearchHistoryControllerView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/22.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct SearchHistoryControllerView: View {
	@ObservedObject var searchViewModel: SearchViewModel
	
	var body: some View {
		HStack(alignment: .center, spacing: 0) {
			Text("최근 검색어")
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: .designSystem(.white)!))
			
			Spacer()
			
			Button(action: {
				searchViewModel.clearSearchHistory()
			}, label: {
				Text("지우기")
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.primary)!))
			})
			
			
		}
		.padding(.vertical, 10)
		
	}
}

struct SearchHistoryControllerView_Previews: PreviewProvider {
	static var previews: some View {
		SearchHistoryControllerView(searchViewModel: SearchViewModel())
	}
}
