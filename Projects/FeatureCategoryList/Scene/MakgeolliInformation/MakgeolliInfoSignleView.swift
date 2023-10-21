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

struct MakgeolliInfoSignleView: View {
	let makgeolliData: MockMakgeolliModel
	
	var body: some View {
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
				.frame(height: 1)
				.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
				.padding(.horizontal, 16)
				.padding(.vertical, 16)
			
			HStack {
				Circle()
					.frame(width: 60)
					.overlay {
						VStack {
							Text("\(makgeolliData.taste[0].description)")
								.foregroundColor(.white)
							Text("\(makgeolliData.tasteScore[0])")
								.foregroundColor(.white)
						}
					}
				Circle()
					.frame(width: 60)
					.overlay {
						VStack {
							Text("\(makgeolliData.taste[1].description)")
								.foregroundColor(.white)
							Text("\(makgeolliData.tasteScore[1])")
								.foregroundColor(.white)
						}
					}
				Circle()
					.frame(width: 60)
					.overlay {
						VStack {
							Text("\(makgeolliData.taste[2].description)")
								.foregroundColor(.white)
							Text("\(makgeolliData.tasteScore[2])")
								.foregroundColor(.white)
						}
					}
				Circle()
					.frame(width: 60)
					.overlay {
						VStack {
							Text("\(makgeolliData.taste[3].description)")
								.foregroundColor(.white)
							Text("\(makgeolliData.tasteScore[3])")
								.foregroundColor(.white)
						}
					}
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
