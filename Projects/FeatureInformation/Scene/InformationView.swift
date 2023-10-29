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
	public let makgeolliData: MockMakgeolliModel
	
	@State private var isclickHearted: Bool = false
	
	public init(makgeolliData: MockMakgeolliModel) {
		self.makgeolliData = makgeolliData
	}
	
	public var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				MakgeolliView(makgeolliData: makgeolliData)
				TasteRatingView(makgeolliData: makgeolliData)
				InfoView()
				AwardView()
				IngredientsView()
				BreweryInfoView()
				PairingFoodView()
				HomepageView()
			}
			.padding(.horizontal, 16)
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

private extension InformationView {
	@ViewBuilder
	func AwardView() -> some View {
		if !makgeolliData.awards.isEmpty {
			MakgeolliDetail(title: "수상", content: makgeolliData.awards.joined(separator: "\n"))
		}
	}
	
	@ViewBuilder
	func BreweryInfoView() -> some View {
		MakgeolliDetail(title: "양조장 정보", content: makgeolliData.breweryInfo)
	}
	
	@ViewBuilder
	func HomepageView() -> some View {
		MakgeolliDetail(title: "홈페이지", content: makgeolliData.website)
	}
	
	@ViewBuilder
	func InfoView() -> some View {
		MakgeolliDetail(title: "정보", content: makgeolliData.info)
	}
	
	@ViewBuilder
	func IngredientsView() -> some View {
		MakgeolliDetail(title: "원재료", content: makgeolliData.ingredients.joined(
			separator: ", ")
		)
	}
	
	@ViewBuilder
	func PairingFoodView() -> some View {
		if !makgeolliData.recommendedFood.isEmpty {
			MakgeolliDetail(title: "어울리는 음식", content: makgeolliData.recommendedFood.joined(
				separator: ", ")
			)
		}
	}
}
