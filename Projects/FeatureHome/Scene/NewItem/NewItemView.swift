//
//  NewItemView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct NewItemView: View {
	@ObservedObject var viewModel: HomeViewModel
	
	var body: some View {
		VStack {
			HStack(spacing: 4) {
				Text("새로 나왔어요")
					.font(.style(.SF22B))
					.foregroundColor(.white)
				Image(systemName: "chevron.right")
					.font(.system(size: 22, weight: .bold))
				Spacer()
			}
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 16) {
					ForEach(MockData.createMockMakgeolli(), id: \.self) { _ in
						NewItemSingleView()
					}
				}
			}
		}
		.padding(.leading, 16)
	}
}
