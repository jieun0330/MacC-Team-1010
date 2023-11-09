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
	
	var body: some View {
		ScrollView(showsIndicators: false) {
			ForEach(searchViewModel.resultMakHolies) { makHoly in
				NavigationLink {
					InformationView(makHolyId: Int(makHoly.id) ?? -1)
						.onAppear {
							searchViewModel.addSearchHistory()
						}
				} label: {
					SearchResultSingleView(makHoly: makHoly)
				}
				
				if makHoly != searchViewModel.resultMakHolies.last {
					DividerView()
				}
				
			}
		}
	}
}

struct SearchResultView_Previews: PreviewProvider {
	static var previews: some View {
		SearchResultView(searchViewModel: SearchViewModel())
	}
}
