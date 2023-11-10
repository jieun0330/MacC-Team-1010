//
//  SettingListView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct SettingListView: View {
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text("문의하기")
					.font(.style(.SF17R))
				Spacer()
				Image(systemName: "chevron.right")
					.font(.style(.SF20B))
			}
			.padding(.bottom, 14)
			Divider()
				.frame(height: 1)
		}
		.padding(.top, 16)
		.padding(.horizontal, 16)
		
		VStack(spacing: 0) {
			HStack {
				Text("의견 보내기")
					.font(.style(.SF17R))
				Spacer()
				Image(systemName: "chevron.right")
					.font(.style(.SF20B))
			}
			.padding(.bottom, 14)
			Divider()
				.frame(height: 1)
		}
		.padding(.horizontal, 16)
		
		VStack(spacing: 0) {
			HStack {
				Text("이용약관")
					.font(.style(.SF17R))
				Spacer()
				Image(systemName: "chevron.right")
					.font(.style(.SF20B))
			}
			.padding(.bottom, 14)
			Divider()
				.frame(height: 1)
		}
		.padding(.horizontal, 16)
		
		VStack(spacing: 0) {
			HStack {
				Text("개인정보처리방침")
					.font(.style(.SF17R))
				Spacer()
				Image(systemName: "chevron.right")
					.font(.style(.SF20B))
			}
			.padding(.bottom, 14)
			Divider()
				.frame(height: 1)
		}
		.padding(.horizontal, 16)
		
		VStack(spacing: 0) {
			HStack {
				Text("버전정보")
					.font(.style(.SF17R))
				Spacer()
				Text("1.0.0")
					.font(.style(.SF12B))
			}
		}
		.padding(.horizontal, 16)
		
		HStack {
			Text("탈퇴하기")
				.font(.style(.SF12B))
				.foregroundColor(Color(uiColor: .designSystem(.alert)!))
			Spacer()
		}
		.padding(.top, 30)
		.padding(.horizontal, 16)
	}
}
