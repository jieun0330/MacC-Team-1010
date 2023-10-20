//
//  RegionView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Common
import FeatureCategory

struct RegionView: View {
	var body: some View {
		VStack(spacing: 0) {
			NavigationLink {
				CategoryView()
					.navigationTitle("지역별로 찾기")
					.navigationBarTitleDisplayMode(.large)
			} label: {
				HStack(spacing: 0) {
					Text("지역별")
						.font(.system(size: 18, weight: .bold))
					Text("로 찾기")
						.font(.system(size: 18, weight: .regular))
					Spacer()
					Image(systemName: "chevron.right")
						.padding(.trailing, 16)
				}
				.foregroundColor(.white)
			}
			Spacer()
				.frame(height: 16)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(RegionType.allCases, id: \.self) { region in
						RegionSingleView(title: region.rawValue)
					}
				}
			}
		}
		.padding(.leading, 16)
	}
}

struct RegionView_Previews: PreviewProvider {
	static var previews: some View {
		RegionView()
	}
}
