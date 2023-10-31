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
	var body: some View {
		let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
		
		ScrollView(.vertical, showsIndicators: false) {
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
