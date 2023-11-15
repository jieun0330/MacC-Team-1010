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
	
	var body: some View {
		if searchViewModel.fetchLoading {
			ProgressView()
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
				.foregroundColor(Color(uiColor: .designSystem(.white)!))
		} else if searchViewModel.resultMakHolies.isEmpty {
			VStack(spacing: 20) {
				Text("검색 결과가 없어요..")
					.SF17R()
					.foregroundColor(.W50)
				Image(uiImage: .designSystem(.character)!)
			}
		} else {
			ScrollView(showsIndicators: false) {
				ForEach(searchViewModel.resultMakHolies, id: \.makNumber) { makHoly in
					Button {
						self.isModelPresented = true
					} label: {
						SearchResultSingleView(makHoly: makHoly)
					}
					.fullScreenCover(isPresented: $isModelPresented) {
						InformationView(makHolyId: Int(makHoly.makNumber ?? 0), isModelPresented: $isModelPresented)
							.onAppear {
								searchViewModel.addSearchHistory(makName: makHoly.makName ?? "")
							}
					}
					
					if makHoly != searchViewModel.resultMakHolies.last {
						DividerView()
					}
				}
			}
		}
	}
}
