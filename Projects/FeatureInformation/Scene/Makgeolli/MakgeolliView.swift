//
//  MakgeolliView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

public struct MakgeolliView: View {
	let makgeolliData: MockMakgeolliModel
	
	public init(makgeolliData: MockMakgeolliModel) {
		self.makgeolliData = makgeolliData
	}
	
	public var body: some View {
		HStack(alignment: .center, spacing: 0) {
			Image(uiImage: .designSystem(makgeolliData.imageName)!)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 180)
				.padding(.leading, 40)
			VStack(alignment: .leading, spacing: 0) {
				Text(makgeolliData.breweryName)
					.bold()
					.font(.system(size: 16))
					.opacity(0.5)
				Text(makgeolliData.name)
					.bold()
					.font(.system(size: 20))
					.frame(height: 51, alignment: .top)
				InfoRow(title: "도수", value: "\(makgeolliData.alcoholContent)%")
				InfoRow(title: "용량", value: "\(makgeolliData.capacity)ml")
				InfoRow(title: "가격", value: "\(makgeolliData.price)원")
			}
			.foregroundColor(.white)
			.padding(.leading, 40)
			Spacer()
		}
		.padding()
		.background(Color(uiColor: .designSystem(.blackBlock)!))
		.cornerRadius(10)
	}
}
