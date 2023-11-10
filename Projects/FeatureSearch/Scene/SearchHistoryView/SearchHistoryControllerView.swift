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
	
	@State var showAlert = false
	
	var body: some View {
		HStack(alignment: .center, spacing: 0) {
			Text("최근 검색어")
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: .designSystem(.white)!))
			
			Spacer()
			
			Button(action: {
				showAlert = true
			}, label: {
				Text("지우기")
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.primary)!))
			})
		}
		.alert(isPresented: $showAlert) {
			Alert(title: Text("최근 검색어 지우기"), message: Text("검색한 기록을 모두 지울까요?"),
				  primaryButton: .cancel(
					Text("취소"),
					action: {}
				  ), secondaryButton: .default(
					Text("지우기"),
					action: {
						searchViewModel.clearSearchHistory()
					}
				  ))
		}
		.padding(.vertical, 10)
	}
}
