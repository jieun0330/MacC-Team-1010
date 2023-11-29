//
//  MyInformationView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import Utils

struct MyInformationView: View {
	@ObservedObject var viewModel: ProfileViewModel
	
	@State var isDataLinking = false
	
	var body: some View {
		GeometryReader { proxy in
			let global = proxy.frame(in: .global)
			Rectangle()
				.fill(Color.DarkGrey)
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
				Text(KeyChainManager.shared.read(account: .nickname))
					.font(.style(.SF20B))
					.padding(.bottom, 4)
				Text("ID: \(KeyChainManager.shared.read(account: .userId))")
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					.padding(.bottom, 24)
				
				NavigationLink {
					EditProfileView(viewModel: viewModel)
				} label: {
					RoundedRectangle(cornerRadius: 12)
						.fill(Color.W10)
						.frame(height: 50)
						.padding(.horizontal, 40)
						.overlay {
							Text("프로필 편집")
								.SF17R()
								.foregroundColor(.W85)
						}
				}
				
				Spacer()
				
				HStack {
					Text("데이터를 안전하게 관리")
						.SF14R()
					Spacer()
					if KeyChainManager.shared.read(account: .phoneBackNum) == "" {
						Text("데이터 저장/불러오기")
							.SF12B()
							.foregroundColor(.Primary)
							.onTapGesture {
								isDataLinking = true
							}
					} else {
						HStack(spacing: 0) {
							Text("010-****-")
								.SF12B()
							Text(KeyChainManager.shared.read(account: .phoneBackNum))
								.SF12B()
						}
					}
				}
				.padding(.bottom, 16)
			}
			.padding(.horizontal, 16)
		}
		.modifier(NavigationBarBackground())
		.fullScreenCover(isPresented: $isDataLinking) {
			PhoneNumberAuthView()
		}
	}
}

private extension MyInformationView {
	@ViewBuilder
	func ProfileImageView() -> some View {
		Image(uiImage: UIImage(named: KeyChainManager.shared.read(account: .profileImage),
							   in: DesignSystem.Constant.bundle, with: nil)!)
	}
}
