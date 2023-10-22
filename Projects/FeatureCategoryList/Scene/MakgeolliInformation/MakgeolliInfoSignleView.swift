//
//  MakgeolliInformationSignleView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core
import FeatureInformation

struct MakgeolliInfoSignleView: View {
	let makgeolliData: MockMakgeolliModel
	
	@State private var isclickHearted: Bool = false
	
	var body: some View {
		NavigationLink {
			InformationView(makgeolliData: makgeolliData)
		} label: {
			VStack {
				HStack(alignment: .center, spacing: 0) {
					Image(uiImage: .designSystem(makgeolliData.imageName)!)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(height: 180)
						.padding(.leading, 40)
					
					HStack(spacing: 0) {
						VStack(alignment: .leading, spacing: 0) {
							MakgeolliInfoContentView(makgeolliData: makgeolliData)
						}
					}
					.padding(.leading, 40)
					Spacer()
				}
				
				Divider()
					.background(Color(uiColor: .designSystem(.tempLightGrayColor)!))
					.frame(height: 1)
					.padding(.horizontal, 16)
					.padding(.vertical, 16)
				
				TasteRatingView(makgeolliData: makgeolliData)
			}
			.padding(.vertical, 20)
			.frame(maxWidth: .infinity)
			.overlay(alignment: .topTrailing) {
				Button {
					self.isclickHearted.toggle()
				} label: {
					isclickHearted ?
					Image(systemName: "heart.fill")
						.foregroundColor(Color(uiColor: .designSystem(.yellowHeart)!))
						.padding(.trailing, 20)
						.padding(.top, 20)
					: Image(systemName: "heart")
						.foregroundColor(Color(uiColor: .designSystem(.yellowHeart)!))
						.padding(.trailing, 20)
						.padding(.top, 20)
				}
			}
		}
	}
}
