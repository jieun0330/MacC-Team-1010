//
//  ContentView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

public struct InformationView: View {
	
	public init() {
	}
	
	public var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				
				TasteScoreView(type: .large, taste: Taste(sweetness: .none, sourness: .two, thickness: .five, freshness: .one))
				
				LikeControllerView()
					.padding(.horizontal, 16)
				
				InfoAwardsView()
					.padding(.leading, 16)
				
				InfoIngredientsView()
					.padding(.horizontal, 16)
				
				InfoLinkView(salesURL: "https://smartstore.naver.com/yangjudoga/products/4714123125", brewery: Brewery(name: "별산의 막걸리", url: "https://www.good-tomorrow.co.kr"))
					.padding(.horizontal, 16)
				
			}
		}
	}
}

struct InformationView_Previews: PreviewProvider {
	static var previews: some View {
		InformationView()
	}
}
