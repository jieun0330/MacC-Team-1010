//
//  MakgeolliInformationSignleView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct MakgeolliInformationSignleView: View {
	var body: some View {
		VStack {
			HStack(alignment: .center, spacing: 0) {
				Image(uiImage: .designSystem(.mockImage)!)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(height: 180)
					.padding(.leading, 40)
				
				HStack(spacing: 0) {
					VStack(alignment: .leading, spacing: 0) {
						Text("순천주조")
							.font(.system(size: 16, weight: .bold))
							.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
							.padding(.bottom, 2)
						Text("하늘달6 생막걸리")
							.font(.system(size: 20, weight: .bold))
							.foregroundColor(.white)
						
						Spacer()
							.frame(height: 20)
						
						HStack(spacing: 10) {
							Text("도수")
								.font(.system(size: 16, weight: .regular))
								.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
							Text("9%")
								.font(.system(size: 16, weight: .regular))
								.foregroundColor(.white)
						}
						.padding(.bottom, 2)
						HStack(spacing: 10) {
							Text("도수")
								.font(.system(size: 16, weight: .regular))
								.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
							Text("9%")
								.font(.system(size: 16, weight: .regular))
								.foregroundColor(.white)
						}
						.padding(.bottom, 2)
						HStack(spacing: 10) {
							Text("도수")
								.font(.system(size: 16, weight: .regular))
								.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
							Text("9%")
								.font(.system(size: 16, weight: .regular))
								.foregroundColor(.white)
						}
					}
				}
				.padding(.leading, 40)
				Spacer()
			}
			
			Divider()
				.frame(height: 1)
				.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
				.padding(.horizontal, 16)
				.padding(.vertical, 16)
			
			HStack {
				Circle()
					.frame(width: 60)
				Circle()
					.frame(width: 60)
				Circle()
					.frame(width: 60)
				Circle()
					.frame(width: 60)
			}
		}
		.padding(.vertical, 20)
		.frame(maxWidth: .infinity)
		.overlay(alignment: .topTrailing) {
			Image(systemName: "heart")
				.foregroundColor(.white)
				.padding(.trailing, 20)
				.padding(.top, 20)
		}
	}
}

struct MakgeolliInformationSignleView_Previews: PreviewProvider {
	static var previews: some View {
		MakgeolliInformationSignleView()
	}
}
