//
//  SearchResultView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import FeatureInformation
import Core

struct SearchResultView: View {
	@ObservedObject var searchViewModel: SearchViewModel
	@State private var isModelPresented: Bool = false
	@State private var selectedMakHoly: SearchResult? = nil
	
	var body: some View {
		if searchViewModel.fetchLoading {
			ProgressView()
				.modifier(ProgressViewBackground())
		} else if searchViewModel.resultMakHolies.isEmpty {
			VStack(spacing: 0) {
				HStack(spacing: 4) {
					Text("'\(searchViewModel.searchText)'")
						.SF17R()
						.foregroundColor(.W85)
					Text("검색 결과가 없어요..")
						.SF17R()
						.foregroundColor(.W50)
				}
				.padding(.bottom, 16)
				
				Button(action: {
					MixpanelManager.shared.requestMakHoly(requestTerm: searchViewModel.searchText)
					searchViewModel.alertItem = AlertItem(title: Text("등록 요청 완료"),
														  message: Text("빠른 시일내에 추가할게요!"),
														  dismissButton: .default(Text("확인")))
				}, label: {
					Text("등록 요청하기")
						.SF17R()
						.foregroundColor(.Primary)
				})
				.padding(.bottom, 48)
				
				Image(uiImage: .designSystem(.character)!)
			}
		} else {
			ScrollView(showsIndicators: false) {
				ForEach(searchViewModel.resultMakHolies, id: \.makNumber) { makHoly in
					Button {
						self.selectedMakHoly = makHoly
					} label: {
						SearchResultSingleView(makHoly: makHoly)
					}
					
					if makHoly != searchViewModel.resultMakHolies.last {
						DividerView()
					}
				}
			}
			.fullScreenCover(item: $selectedMakHoly) { makHoly in
				let makHolyId = makHoly.makNumber ?? 0
				InformationView(makHolyId: makHolyId, 
								mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																		 searchTerm: searchViewModel.searchText))
					.onAppear {
						if let name = makHoly.makName {
							searchViewModel.addSearchHistory(makName: name)
						}
					}
			}
		}
	}
}
