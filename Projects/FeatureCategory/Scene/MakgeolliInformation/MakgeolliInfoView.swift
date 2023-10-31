//
//  MakgeolliInformationView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct MakgeolliInfoView: View {
	let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			HStack {
				Text("어떤 방식으로 목록이 나오나요?")
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
				Spacer()
				Text("추천순")
					.foregroundColor(Color(uiColor: .designSystem(.primary)!))
			}
			.font(.style(.SF12R))
			.padding(.horizontal, 16)
			.padding(.bottom, 16)
			LazyVGrid(columns: columns) {
				ForEach(MockData.createMockMakgeolli(), id: \.self) { data in
					MakgeolliInfoSingleView(makgeolliData: data)
						.cornerRadius(12)
						.padding(.horizontal, 8)
						.padding(.bottom, 30)
				}
			}
		}
	}
}
