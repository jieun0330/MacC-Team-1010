//
//  SearchResultSingleView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/22.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct SearchResultSingleView: View {
	let makHoly: MakHolyMini
	
	var body: some View {
		HStack(alignment: .center, spacing: 0) {
			
			imageView()
			
			Spacer()
				.frame(width: 16)
			
			descriptionView()
			
			Spacer()
			
			TasteScoreView(type: .mini, sweetness: makHoly.sweetness, sourness: makHoly.sourness, thickness: makHoly.thickness, freshness: makHoly.freshness)
			
		}
		.frame(height: 80)
		.padding(.vertical, 10)
	}
}

struct SearchResultSingleView_Previews: PreviewProvider {
	static var previews: some View {
		SearchResultSingleView(makHoly: MakHolyMini.test1)
	}
}


extension SearchResultSingleView {
	func imageView() -> some View {
		ZStack {
			RoundedRectangle(cornerRadius: 13)
				.foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
				.frame(width: 60, height: 80)
			Image(uiImage: .designSystem(.mockMakgeolli)!)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 29, height: 60)
		}
	}
	
	func descriptionView() -> some View {
		VStack(alignment: .leading, spacing: 0) {
			Text(makHoly.name)
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: .designSystem(.white)!))
			Text(String.formattedSet(adv: makHoly.adv, volume: makHoly.volume, price: makHoly.price))
				.font(.style(.SF12R))
				.foregroundColor(Color(uiColor: .designSystem(.white)!))
				.opacity(0.5)
		}
	}
}
