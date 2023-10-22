//
//  SearchResultView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import FeatureInformation

struct SearchResultView: View {
	@ObservedObject var searchViewModel: SearchViewModel
	
	var body: some View {
		ScrollView(showsIndicators: false) {
			ForEach(searchViewModel.resultMakgeollies, id: \.self) { makgeolli in
				NavigationLink {
					InformationView(makgeolliData: makgeolli)
						.onAppear {
							searchViewModel.addSearchHistory()
						}
				} label: {
					SearchResultSingleView(makgeolliData: makgeolli)
				}
				Spacer().frame(height: 10)
			}
		}
	}
}

struct SearchResultView_Previews: PreviewProvider {
	static var previews: some View {
		SearchResultView(searchViewModel: SearchViewModel())
	}
}
