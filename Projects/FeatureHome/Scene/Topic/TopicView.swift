//
//  TopicView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 12/2/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import FeatureCategory

struct TopicView: View {
    var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 4) {
				Text("주제로 찾기")
					.font(.style(.SF20B))
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
				Image(systemName: "chevron.right")
					.font(.system(size: 20, weight: .bold))
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
				Spacer()
			}
			.padding(.leading, 16)
			Spacer()
				.frame(height: 20)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 16) {
					Spacer()
						.frame(width: 16, height: 1)
						.padding(.trailing, -16)
					ForEach(TopicType.allCases, id: \.self) { topic in
						NavigationLink {
							CategoryView(type: topic == .pohang ? .pohang : .koreaAward2023,
										 targetTitle: [])
						} label: {
							TopicSingleView(topic: topic)
						}
					}
					Spacer()
						.frame(width: 16, height: 1)
						.padding(.leading, -16)
				}
			}
		}
		.modifier(NavigationBarBackground())
    }
}
