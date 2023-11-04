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
	@ObservedObject var viewModel: CategoryViewModel
	
	let type: CategoryType
	let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			HStack(spacing: 4) {
				Image(systemName: "questionmark.circle.fill")
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
				Text("리스트 순서가 궁금하신가요")
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
				Spacer()
				Text("추천순")
					.foregroundColor(Color(uiColor: .designSystem(.primary)!))
			}
			.font(.style(.SF12R))
			.padding(.horizontal, 8)
			.padding(.vertical, 16)
			
			LazyVGrid(columns: columns) {
				ForEach(viewModel.makHolys, id: \.self) { data in
					MakgeolliInfoSingleView(makHoly: data)
						.padding(.horizontal, 8)
						.padding(.bottom, 30)
				}
			}
		}
	}
}
