//
//  ContentView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Common
import Core

public struct InformationView: View {
	let makgeolliData: MockMakgeolliModel
	
	@State private var isclickHearted: Bool = false
	
	public init(makgeolliData: MockMakgeolliModel) {
		self.makgeolliData = makgeolliData
	}
	
	public var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				MakgeolliView(makgeolliData: makgeolliData)
//				TasteRatingView(makgeolliData: MockMakgeolliModel())
				TasteRatingView(makgeolliData: makgeolliData)
				InfoView(makgeolliData: makgeolliData)
				AwardView(makgeolliData: makgeolliData)
				IngredientsView(makgeolliData: makgeolliData)
				BreweryInfoView(makgeolliData: makgeolliData)
				PairingFoodView(makgeolliData: makgeolliData)
				HomepageView(makgeolliData: makgeolliData)
			}
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton(), trailing:
								Button(action: {
			self.isclickHearted.toggle()
		}, label: {
			isclickHearted ?
			Image(systemName: "heart.fill")
				.foregroundColor(Color(uiColor: .designSystem(.yellowHeart)!))
			: Image(systemName: "heart")
				.foregroundColor(Color(uiColor: .designSystem(.yellowHeart)!))
		}))
		.toolbarBackground(Color.black, for: .navigationBar)
		.background(Color.black)
	}
}
