//
//  MyInformationView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct MyInformationView: View {
    var body: some View {
		GeometryReader { proxy in
			let global = proxy.frame(in: .global)
			LinearGradient(
				stops: [
					Gradient.Stop(color: Color(red: 0.71, green: 0.66, blue: 0.48),
								  location: 0.00),
					Gradient.Stop(color: Color(red: 0.18, green: 0.18, blue: 0.39),
								  location: 1.00),
				],
				startPoint: UnitPoint(x: 0.45, y: 0),
				endPoint: UnitPoint(x: 0.45, y: 1)
			)
			// image로 변경 시 resizable 추가해야함
			.offset(y: global.minY > 0 ? -global.minY : 0)
			.frame(
				height: global.minY > 0 ?
				(UIScreen.main.bounds.height/2.5) + global.minY
				: UIScreen.main.bounds.height/2.5
			)
		}
		.frame(height: UIScreen.main.bounds.height / 2.5)
		.overlay {
			VStack(spacing: 0) {
				Spacer()
				Image(uiImage: .designSystem(.sour)!)
					.padding(.bottom, 24)
				Text("걸쭉한청록색라쿤")
					.font(.style(.SF22B))
					.padding(.bottom, 4)
				Text("ID: 123456789")
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					.padding(.bottom, 24)
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(.w10)!))
					.frame(height: 50)
					.overlay {
						Text("프로필 편집")
							.font(.style(.SF17R))
					}
				Spacer()
				HStack {
					Text("데이터를 안전하게 관리")
						.font(.style(.SF14R))
					Spacer()
					Text("데이터 저장/불러오기")
						.font(.style(.SF12B))
						.foregroundColor(Color(uiColor: .designSystem(.primary)!))
				}
				.padding(.bottom, 16)
			}
			.padding(.horizontal, 16)
		}
    }
}
