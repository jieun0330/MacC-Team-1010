//
//  MyInformationView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Utils

struct MyInformationView: View {
	var body: some View {
		GeometryReader { proxy in
			let global = proxy.frame(in: .global)
			LinearGradient(
				stops: [
					Gradient.Stop(color: .NightSky2Top, location: 0.00),
					Gradient.Stop(color: .NightSky2Bottom, location: 1.00),
				],
				startPoint: UnitPoint(x: 0.45, y: 0),
				endPoint: UnitPoint(x: 0.45, y: 1)
			)
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
				ProfileImageView()
					.padding(.bottom, 24)
				Text(UserDefaultsSetting.nickname)
					.font(.style(.SF20B))
					.padding(.bottom, 4)
				Text("ID: \(KeyChainManager.shared.read(account: .userId))")
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					.padding(.bottom, 24)
				// 추후 추가
				//				RoundedRectangle(cornerRadius: 12)
				//					.fill(Color(uiColor: .designSystem(.w10)!))
				//					.frame(height: 50)
				//					.overlay {
				//						Text("프로필 편집")
				//							.font(.style(.SF17R))
				//					}
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
			.onAppear {
				print("ddd \(UserDefaultsSetting.profileImage)")
			}
			.padding(.horizontal, 16)
		}
	}
}

private extension MyInformationView {
	@ViewBuilder
	func ProfileImageView() -> some View {
		switch UserDefaultsSetting.profileImage {
		case "profileSweet":
			Image(uiImage: .designSystem(.profileSweet)!)
		case "profileHighlyHydrated":
			Image(uiImage: .designSystem(.profileHighlyHydrated)!)
		case "profileThick":
			Image(uiImage: .designSystem(.profileThick)!)
		case "profileCarbonicAcid":
			Image(uiImage: .designSystem(.profileCarbonicAcid)!)
		case "profileAspartameFree":
			Image(uiImage: .designSystem(.profileAspartameFree)!)
		case "profileSour":
			Image(uiImage: .designSystem(.profileSour)!)
		default:
			Image(uiImage: .designSystem(.profileSweet)!)
		}
	}
}
