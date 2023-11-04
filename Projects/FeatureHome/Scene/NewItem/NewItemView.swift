//
//  NewItemView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import FeatureCategory

struct NewItemView: View {
	@ObservedObject var viewModel: HomeViewModel
	
	var body: some View {
		VStack {
			NavigationLink {
				CategoryView(type: .new, targetTitle: [])
			} label: {
				HStack(spacing: 4) {
					Text("새로 나왔어요")
						.font(.style(.SF22B))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					Image(systemName: "chevron.right")
						.font(.system(size: 22, weight: .bold))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					Spacer()
				}
			}
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 16) {
					ForEach(viewModel.newItems, id: \.self) { item in
						NewItemSingleView(item: item)
					}
				}
			}
		}
		.padding(.leading, 16)
	}
}
